import fugaku
import logging
import re
import os
import sys
import pickle
import json
from six.moves.urllib.parse import quote

""" client_id, client_secret, redirect_url 
"""
CLIENT_CONFIG = {
    "client_id": "my_client_id",
    "client_secret": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "redirect_uri": "https://host/callback",
    "scope": "openid+offline_access"
}

metadata_url = "https://idp.fugaku.r-ccs.riken.jp/auth/realms/op/.well-known/openid-configuration"

target_computer = "computer"

proxies = {
        "http": "xxx.xxx.xxx.xxx:xxxx",
        "https": "xxx.xxx.xxx.xxx:xxxx" 
}

home_dir = "/home/fjuser/xxxxxx"

logger = logging.getLogger(__name__)

def setup():
    if not os.path.isdir('./session'):
        os.mkdir("./session")
    if not os.path.isdir('./log'):
        os.mkdir("./log")
    logging.basicConfig(filename='./log/sample.log', level=logging.DEBUG)

    client = None
    session_file = "./session/client.dmp"
    if os.path.isfile(session_file):
        try:
            with open(session_file, 'rb') as f:
                client = pickle.load(f)
                if client._access_token is None:
                    client = None
        except Exception as e:
            print("{}", e)
            client = None

    if client is None:
        print("Please access the following URL.")
        print(f"https://idp.fugaku.r-ccs.riken.jp/auth/realms/op/protocol/openid-connect/auth?response_type=code&scope=openid+offline_access&client_id={CLIENT_CONFIG['client_id']}&redirect_uri={quote(CLIENT_CONFIG['redirect_uri'])}")
        try:
            print("Paste Browser URL:")
            line = sys.stdin.readline().strip()
            print(f"{line}")
            pos  = line.find("&code=")
            if pos > 0:
                auth_code = line[pos+6:]
                pos = auth_code.find("&")
                if pos > 0:
                    auth_code = auth_code[:pos-1]

                print(f"{auth_code}")

                client = fugaku.Client(auth_code=auth_code, client_config=CLIENT_CONFIG,
                        provider_metadata_url=metadata_url,
                        request_config={"proxies": proxies})
                if client and client._access_token:
                    with open(session_file, 'wb') as f:
                        pickle.dump(client, f)
                else:
                    print(f"No access token.")
                    client = None
            else:
                print("Invalid URL. No code.")
                return None
        except fugaku.FugakuClientError as e:
            logger.exception("exeption:{0}".format(e))
    return client


def _get_machine_status(client):
    response = client.get_machine_status()
    print(f"status_code:{response.status_code}")
    print(f"json:{json.dumps(response.json())}")


def _download_fileList(client):
    response = client.download_fileList(target_computer, "~/")
    print(f"status_code:{response.status_code}")
    file_list = response.json()['output'].strip().replace("\\n", "\n")
    print(f"file_list:{file_list}")


def _download_fileList(client):
    response = client.download_fileList(target_computer, "~/")
    print(f"status_code:{response.status_code}")
    file_list = response.json()['output'].strip().replace("\\n", "\n")
    print(f"file_list:{file_list}")


def _download_filedata(client):
    client._request_config["stream"] = True
    response = client.download_filedata(target_computer, f"{home_dir}/.bashrc")
    print(f"status_code:{response.status_code}")
    if response.status_code == 200:
        local_file = "_download_filedata.out"
        if os.path.isfile(local_file):
            os.remove(local_file)
        with open(local_file, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
        print(f"{os.stat(local_file)}")


def _upload_file(client):
    local_file = "_uploadfile.out"
    if os.path.isfile(local_file):
        os.remove(local_file)
    with open(local_file, 'wb') as f:
        for i in range(10):
            f.write(f"line: {i}".encode('utf-8'))
     
    response = client.exec_command(target_computer, "rm -f {home_dir}/{local_file}")
    output = response.json()['output'].strip().replace("\\n", "\n")
    print(f"output:{output}")

    response = client.upload_file(target_computer, f"{home_dir}/{local_file}", local_file)
    print(f"status_code:{response.status_code}")
    print(f"json:{json.dumps(response.json())}")

    # did not overrite
    response = client.upload_file(target_computer, f"{home_dir}/{local_file}", local_file)
    print(f"status_code:{response.status_code}")
    print(f"json:{json.dumps(response.json())}")

    response = client.modify_file(target_computer, f"{home_dir}/{local_file}", local_file)
    print(f"status_code:{response.status_code}")
    print(f"json:{json.dumps(response.json())}")


def _exec_command(client):
    response = client.exec_command(target_computer, "id")
    output = response.json()['output'].strip().replace("\\n", "\n")
    print(f"output:{output}")

    response = client.exec_command(target_computer, "mkdir -p ~/job-script; ls -ld ~/job-script")
    output = response.json()['output'].strip().replace("\\n", "\n")
    print(f"output:{output}")


def _make_Jobscript(client):
    script = {"APP_DATA":
                {"ProgramGroupList":
                  {"ProgramGroup": [
                    {"ProgramList": {
                       "Program": [
                           {"Type": "mpi",
                            "FileName": "job-script/calc.sh",
                            "ThreadMode": "parallel",
                            "Threads": "1"
                            }
                       ]
                   },
                       "GroupType": "serialgroup"
                   }
                  ]
                 }
               },
              "COMMON_DATA": {
                  "NODE": "1",
                  "QUEUE": "1rack-A01",
                  "QOPT": " -L \"rscunit=rscunit_ft01\" "
              }
             }
    response = client.make_Jobscript(
        target_computer, f"{home_dir}/job-script/st-job.sh", script)
    print(f"status_code:{response.status_code} json:{response.json()}")


def _submit_job(client):
    response = client.submit_job(
        target_computer, f"{home_dir}/job-script/st-job.sh")
    print(f"status_code:{response.status_code} json:{response.json()}")
    jobid = None
    if response.status_code == 200:
        jobid = response.json()["output"]
        result = re.match("^\\[INFO\\] PJM \\d+ pjsub Job (\\d+) submitted.", jobid.strip())
        if result :
            jobid = result.group(1)
    return jobid


def _get_job_status(client, jobid):
    response = client.get_job_status(target_computer)
    print(f"status_code:{response.status_code} json:{response.json()}")

    if jobid:
        response = client.get_job_status(target_computer, jobid=jobid)
        print(f"status_code:{response.status_code} json:{response.json()}")
    else:
        print(f"jobid is None")


def _get_job_detail(client, jobid):
    if jobid:
        response = client.get_job_detail(target_computer, jobid=jobid)
        print(f"status_code:{response.status_code} json:{response.json()}")
    else:
        print(f"jobid is None")


def _cancel_job(client, jobid):
    if jobid:
        response = client.cancel_job(target_computer, jobid=jobid)
        print(f"status_code:{response.status_code} json:{response.json()}")
    else:
        print(f"jobid is None")


def _get_job_status_saact(client, jobid):
    response = client.get_job_status_saact(target_computer)
    print(f"status_code:{response.status_code} json:{response.json()}")

    if jobid:
        response = client.get_job_status_saact(target_computer, jobid=jobid)
        print(f"status_code:{response.status_code} json:{response.json()}")
    else:
        print(f"jobid is None")


def main():
    client = setup()
    if client:
        print(f"{client}")
        try:
            _get_machine_status(client)
            _download_fileList(client)
            _download_filedata(client)
            _upload_file(client)
            _exec_command(client)
            _make_Jobscript(client)
            jobid = _submit_job(client)
            _get_job_status(client, jobid)
            _cancel_job(client, jobid)
            _get_job_status_saact(client, jobid)
        except fugaku.FugakuClientError as e:
            logger.exception("exeption:{0}".format(e))
            session_file = "./session/client.dmp"
            if os.path.isfile(session_file):
                os.remove(session_file)


if __name__ == "__main__":
    main()


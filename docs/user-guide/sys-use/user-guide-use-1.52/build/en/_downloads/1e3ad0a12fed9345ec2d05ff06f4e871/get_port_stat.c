#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/ioctl.h>

#define TOFU_DEV_INFO "/proc/tofu/dev/info"
#define TOF_IOCTL_GET_PORT_STAT _IOWR('d', 9, long)
#define PA_LEN 31
#define IOCTL_REQ_MASK 0xFFFCFF30

struct tof_get_port_stat {
	int port_no;
	uint64_t mask;
	uint64_t pa[PA_LEN];
};

int port_stat_ioctl(int port_no, uint64_t *pa) {
	int ret = 0, fd;
	struct tof_get_port_stat req;

	fd = open(TOFU_DEV_INFO, O_RDWR|O_CLOEXEC);
	if (fd < 0) {
		perror("open(TOFU_DEV_INFO)");
		return -1;
	}

	req.port_no = port_no;
	req.mask = IOCTL_REQ_MASK;
	memset(req.pa, 0, sizeof(req.pa));

	ret = ioctl(fd, TOF_IOCTL_GET_PORT_STAT, &req);
	if (ret < 0) {
		perror("ioctl(TOF_IOCTL_GET_PORT_STAT)");
	} else {
		memcpy(pa, req.pa, sizeof(req.pa));
	}

	close(fd);
	return ret;
}

char* port_name[11] = {"dummy", "A", "C", "B-", "B+", "X-", "X+", "Y-", "Y+", "Z-", "Z+" };

int main(int argc, char *argv[]) {
	int port_no, ret;
	uint64_t pa[PA_LEN];

	printf("port_name,pa[0],pa[1],pa[2],pa[3],pa[6],pa[7],pa[16],pa[17]\n");
	for(port_no = 1; port_no <= 10; port_no++) {
		ret = port_stat_ioctl(port_no, pa);
		if (ret < 0)
			return ret;
		printf("%s,%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld\n",
			port_name[port_no], pa[0], pa[1], pa[2], pa[3], pa[6], pa[7], pa[16], pa[17]);
	}

	return 0;
}


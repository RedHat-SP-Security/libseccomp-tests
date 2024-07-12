#include <stdio.h>
#include <seccomp.h>

int main(void)
{
	const struct scmp_version *version = seccomp_version();
	printf("Version: %d.%d.%d\n", version->major, version->minor, version->micro);
	return 0;
}
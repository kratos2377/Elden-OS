#include "shell.h"
#include "stdio.h"
#include "stdlib.h"
#include "eldenos.h"
int main(int argc, char** argv)
{
    print("Elden-OS v1.0.0\n");
    while(1) 
    {
        print("> ");
        char buf[1024];
        eldenos_terminal_readline(buf, sizeof(buf), true);
        print("\n");
        eldenos_system_run(buf);
        
        print("\n");
    }
    return 0;
}
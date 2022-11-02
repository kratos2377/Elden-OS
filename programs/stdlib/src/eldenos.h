#ifndef ELDENOS_H
#define ELDENOS_H
#include <stddef.h>
#include <stdbool.h>


struct command_argument
{
    char argument[512];
    struct command_argument* next;
};

struct process_arguments
{
    int argc;
    char** argv;
};


void print(const char* filename);
int eldenos_getkey();

void* eldenos_malloc(size_t size);
void eldenos_free(void* ptr);
void eldenos_putchar(char c);
int eldenos_getkeyblock();
void eldenos_terminal_readline(char* out, int max, bool output_while_typing);
void eldenos_process_load_start(const char* filename);
struct command_argument* eldenos_parse_command(const char* command, int max);
void eldenos_process_get_arguments(struct process_arguments* arguments);
int eldenos_system(struct command_argument* arguments);
int eldenos_system_run(const char* command);
void eldenos_exit();
#endif
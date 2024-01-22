%{
#include <stdio.h>
%}

%%
[ \n]                   printf("\n");
"//"[a-zA-Z][a-zA-Z0-9]*  printf("COMMENT");
[=]                     printf(" assign");
[0123456789]+           printf("inum");
[0-9]+.[0-9]+           printf("fnum");
f                       printf("floatdcl");
p                       printf("print");
i                       printf("intdcl");
[a-zA-Z][a-zA-Z0-9]*    printf("id");

%%

int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}


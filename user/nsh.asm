
user/_nsh:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
        }
    }
}

// Función principal de la shell
int main(int argc, char* argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	8d 75 84             	lea    -0x7c(%ebp),%esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	81 ec 88 00 00 00    	sub    $0x88,%esp
    char buf[100];

    while (1) {
        printf(1, "$ ");  // Prompt
  1a:	83 ec 08             	sub    $0x8,%esp
  1d:	68 e4 09 00 00       	push   $0x9e4
  22:	6a 01                	push   $0x1
  24:	e8 17 06 00 00       	call   640 <printf>
        gets(buf, sizeof(buf));
  29:	58                   	pop    %eax
  2a:	5a                   	pop    %edx
  2b:	6a 64                	push   $0x64
  2d:	56                   	push   %esi
  2e:	e8 6d 03 00 00       	call   3a0 <gets>

        if (strlen(buf) == 0) {
  33:	89 34 24             	mov    %esi,(%esp)
  36:	e8 d5 02 00 00       	call   310 <strlen>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	74 d8                	je     1a <main+0x1a>
            continue;  // Si no hay comando, vuelve a pedir input
        }

        // Si el usuario escribe 'exit', se sale de la shell
        if (strcmp(buf, "exit") == 0) {
  42:	83 ec 08             	sub    $0x8,%esp
  45:	68 e7 09 00 00       	push   $0x9e7
  4a:	56                   	push   %esi
  4b:	e8 70 02 00 00       	call   2c0 <strcmp>
  50:	83 c4 10             	add    $0x10,%esp
  53:	85 c0                	test   %eax,%eax
  55:	0f 84 ae 00 00 00    	je     109 <main+0x109>
            break;
        }

        // Ejecuta comandos separados por ";"
        char *cmd = buf;
  5b:	89 f7                	mov    %esi,%edi
    while (*cmd != '\0') {
  5d:	0f b6 07             	movzbl (%edi),%eax
  60:	89 fb                	mov    %edi,%ebx
  62:	84 c0                	test   %al,%al
  64:	75 11                	jne    77 <main+0x77>
  66:	eb 48                	jmp    b0 <main+0xb0>
  68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6f:	90                   	nop
  70:	0f b6 03             	movzbl (%ebx),%eax
  73:	84 c0                	test   %al,%al
  75:	74 39                	je     b0 <main+0xb0>
        if (*cmd == ';') {
  77:	89 da                	mov    %ebx,%edx
            return cmd + 1; // Retorna el puntero al siguiente comando
  79:	83 c3 01             	add    $0x1,%ebx
        if (*cmd == ';') {
  7c:	3c 3b                	cmp    $0x3b,%al
  7e:	75 f0                	jne    70 <main+0x70>

        while (cmd != 0) {
            next_cmd = find_next_command(cmd);

            // Soporte para ejecución en segundo plano con "&"
            char *ampersand = strchr(cmd, '&');
  80:	83 ec 08             	sub    $0x8,%esp
            *cmd = '\0';
  83:	c6 02 00             	movb   $0x0,(%edx)
            char *ampersand = strchr(cmd, '&');
  86:	6a 26                	push   $0x26
  88:	57                   	push   %edi
  89:	e8 d2 02 00 00       	call   360 <strchr>
            if (ampersand != 0) {
  8e:	83 c4 10             	add    $0x10,%esp
            char *ampersand = strchr(cmd, '&');
  91:	89 c2                	mov    %eax,%edx
            if (ampersand != 0) {
  93:	85 c0                	test   %eax,%eax
  95:	75 2d                	jne    c4 <main+0xc4>
                }
                // Ejecuta el siguiente comando si existe después del '&'
                cmd = ampersand + 1;
                continue; // Sigue con el resto del bucle
            } else {
                ejecutar_comando(cmd);  // Ejecución normal
  97:	83 ec 0c             	sub    $0xc,%esp
  9a:	57                   	push   %edi
            return cmd + 1; // Retorna el puntero al siguiente comando
  9b:	89 df                	mov    %ebx,%edi
                ejecutar_comando(cmd);  // Ejecución normal
  9d:	e8 1e 01 00 00       	call   1c0 <ejecutar_comando>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	eb b6                	jmp    5d <main+0x5d>
  a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ae:	66 90                	xchg   %ax,%ax
            char *ampersand = strchr(cmd, '&');
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	6a 26                	push   $0x26
  b5:	57                   	push   %edi
  b6:	e8 a5 02 00 00       	call   360 <strchr>
            if (ampersand != 0) {
  bb:	83 c4 10             	add    $0x10,%esp
            char *ampersand = strchr(cmd, '&');
  be:	89 c2                	mov    %eax,%edx
            if (ampersand != 0) {
  c0:	85 c0                	test   %eax,%eax
  c2:	74 34                	je     f8 <main+0xf8>
                *ampersand = '\0';  // Termina el comando en el '&'
  c4:	c6 02 00             	movb   $0x0,(%edx)
  c7:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%ebp)
                if (fork() == 0) {
  cd:	e8 09 04 00 00       	call   4db <fork>
  d2:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  d8:	85 c0                	test   %eax,%eax
  da:	75 14                	jne    f0 <main+0xf0>
                    ejecutar_comando(cmd);
  dc:	83 ec 0c             	sub    $0xc,%esp
  df:	57                   	push   %edi
  e0:	e8 db 00 00 00       	call   1c0 <ejecutar_comando>
                    exit();  // Asegura que el proceso hijo termine
  e5:	e8 f9 03 00 00       	call   4e3 <exit>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                cmd = ampersand + 1;
  f0:	8d 7a 01             	lea    0x1(%edx),%edi
        while (cmd != 0) {
  f3:	e9 65 ff ff ff       	jmp    5d <main+0x5d>
                ejecutar_comando(cmd);  // Ejecución normal
  f8:	83 ec 0c             	sub    $0xc,%esp
  fb:	57                   	push   %edi
  fc:	e8 bf 00 00 00       	call   1c0 <ejecutar_comando>
 101:	83 c4 10             	add    $0x10,%esp
 104:	e9 11 ff ff ff       	jmp    1a <main+0x1a>
            }

            cmd = next_cmd;
        }
    }
    exit();
 109:	e8 d5 03 00 00       	call   4e3 <exit>
 10e:	66 90                	xchg   %ax,%ax

00000110 <parse_command>:
void parse_command(char *cmd, char **argv) {
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    while (*cmd != '\0') {
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	74 57                	je     178 <parse_command+0x68>
 121:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        while (*cmd == ' ' || *cmd == '\t' || *cmd == '\n') {
 128:	8d 4a f7             	lea    -0x9(%edx),%ecx
 12b:	80 f9 01             	cmp    $0x1,%cl
 12e:	77 13                	ja     143 <parse_command+0x33>
 130:	0f b6 50 01          	movzbl 0x1(%eax),%edx
            *cmd++ = '\0';
 134:	83 c0 01             	add    $0x1,%eax
 137:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
        while (*cmd == ' ' || *cmd == '\t' || *cmd == '\n') {
 13b:	8d 4a f7             	lea    -0x9(%edx),%ecx
 13e:	80 f9 01             	cmp    $0x1,%cl
 141:	76 ed                	jbe    130 <parse_command+0x20>
 143:	80 fa 20             	cmp    $0x20,%dl
 146:	74 e8                	je     130 <parse_command+0x20>
        *argv++ = cmd;
 148:	89 03                	mov    %eax,(%ebx)
        while (*cmd != '\0' && *cmd != ' ' && *cmd != '\t' && *cmd != '\n') {
 14a:	0f b6 10             	movzbl (%eax),%edx
        *argv++ = cmd;
 14d:	83 c3 04             	add    $0x4,%ebx
        while (*cmd != '\0' && *cmd != ' ' && *cmd != '\t' && *cmd != '\n') {
 150:	8d 4a f7             	lea    -0x9(%edx),%ecx
 153:	80 f9 01             	cmp    $0x1,%cl
 156:	77 17                	ja     16f <parse_command+0x5f>
 158:	eb 1a                	jmp    174 <parse_command+0x64>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
            cmd++;
 164:	83 c0 01             	add    $0x1,%eax
        while (*cmd != '\0' && *cmd != ' ' && *cmd != '\t' && *cmd != '\n') {
 167:	8d 4a f7             	lea    -0x9(%edx),%ecx
 16a:	80 f9 01             	cmp    $0x1,%cl
 16d:	76 05                	jbe    174 <parse_command+0x64>
 16f:	f6 c2 df             	test   $0xdf,%dl
 172:	75 ec                	jne    160 <parse_command+0x50>
    while (*cmd != '\0') {
 174:	84 d2                	test   %dl,%dl
 176:	75 b0                	jne    128 <parse_command+0x18>
    *argv = 0;
 178:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 17e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 181:	c9                   	leave  
 182:	c3                   	ret    
 183:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <find_next_command>:
char *find_next_command(char *cmd) {
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	eb 12                	jmp    1aa <find_next_command+0x1a>
 198:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop
        if (*cmd == ';') {
 1a0:	89 c1                	mov    %eax,%ecx
            return cmd + 1; // Retorna el puntero al siguiente comando
 1a2:	83 c0 01             	add    $0x1,%eax
        if (*cmd == ';') {
 1a5:	80 fa 3b             	cmp    $0x3b,%dl
 1a8:	74 0e                	je     1b8 <find_next_command+0x28>
    while (*cmd != '\0') {
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 ef                	jne    1a0 <find_next_command+0x10>
    return 0; // No más comandos
 1b1:	31 c0                	xor    %eax,%eax
}
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
            *cmd = '\0';
 1b8:	c6 01 00             	movb   $0x0,(%ecx)
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <ejecutar_comando>:
void ejecutar_comando(char *cmd) {
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
    parse_command(cmd, argv);
 1c4:	8d 5d d0             	lea    -0x30(%ebp),%ebx
void ejecutar_comando(char *cmd) {
 1c7:	83 ec 3c             	sub    $0x3c,%esp
    parse_command(cmd, argv);
 1ca:	53                   	push   %ebx
 1cb:	ff 75 08             	pushl  0x8(%ebp)
 1ce:	e8 3d ff ff ff       	call   110 <parse_command>
    if (argv[0] == 0) {
 1d3:	8b 45 d0             	mov    -0x30(%ebp),%eax
 1d6:	83 c4 10             	add    $0x10,%esp
 1d9:	85 c0                	test   %eax,%eax
 1db:	74 52                	je     22f <ejecutar_comando+0x6f>
    if (strcmp(argv[0], "echo") == 0) {
 1dd:	83 ec 08             	sub    $0x8,%esp
 1e0:	68 a8 09 00 00       	push   $0x9a8
 1e5:	50                   	push   %eax
 1e6:	e8 d5 00 00 00       	call   2c0 <strcmp>
 1eb:	83 c4 10             	add    $0x10,%esp
 1ee:	85 c0                	test   %eax,%eax
 1f0:	75 46                	jne    238 <ejecutar_comando+0x78>
        for (int i = 1; argv[i] != 0; i++) {
 1f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1f5:	85 c0                	test   %eax,%eax
 1f7:	74 24                	je     21d <ejecutar_comando+0x5d>
 1f9:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            printf(1, "%s ", argv[i]);
 200:	83 ec 04             	sub    $0x4,%esp
        for (int i = 1; argv[i] != 0; i++) {
 203:	83 c3 04             	add    $0x4,%ebx
            printf(1, "%s ", argv[i]);
 206:	50                   	push   %eax
 207:	68 ad 09 00 00       	push   $0x9ad
 20c:	6a 01                	push   $0x1
 20e:	e8 2d 04 00 00       	call   640 <printf>
        for (int i = 1; argv[i] != 0; i++) {
 213:	8b 43 fc             	mov    -0x4(%ebx),%eax
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	75 e3                	jne    200 <ejecutar_comando+0x40>
        printf(1, "\n");
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	68 c7 09 00 00       	push   $0x9c7
 225:	6a 01                	push   $0x1
 227:	e8 14 04 00 00       	call   640 <printf>
 22c:	83 c4 10             	add    $0x10,%esp
}
 22f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 232:	c9                   	leave  
 233:	c3                   	ret    
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        int pid = fork();
 238:	e8 9e 02 00 00       	call   4db <fork>
        if (pid < 0) {
 23d:	85 c0                	test   %eax,%eax
 23f:	78 0f                	js     250 <ejecutar_comando+0x90>
        } else if (pid == 0) {
 241:	74 21                	je     264 <ejecutar_comando+0xa4>
            wait();
 243:	e8 a3 02 00 00       	call   4eb <wait>
}
 248:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 24b:	c9                   	leave  
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
            printf(1, "Error al crear proceso\n");
 250:	83 ec 08             	sub    $0x8,%esp
 253:	68 b1 09 00 00       	push   $0x9b1
 258:	6a 01                	push   $0x1
 25a:	e8 e1 03 00 00       	call   640 <printf>
 25f:	83 c4 10             	add    $0x10,%esp
 262:	eb cb                	jmp    22f <ejecutar_comando+0x6f>
            exec(argv[0], argv);
 264:	50                   	push   %eax
 265:	50                   	push   %eax
 266:	53                   	push   %ebx
 267:	ff 75 d0             	pushl  -0x30(%ebp)
 26a:	e8 ac 02 00 00       	call   51b <exec>
            printf(1, "Comando no encontrado: %s\n", argv[0]);
 26f:	83 c4 0c             	add    $0xc,%esp
 272:	ff 75 d0             	pushl  -0x30(%ebp)
 275:	68 c9 09 00 00       	push   $0x9c9
 27a:	6a 01                	push   $0x1
 27c:	e8 bf 03 00 00       	call   640 <printf>
            exit();
 281:	e8 5d 02 00 00       	call   4e3 <exit>
 286:	66 90                	xchg   %ax,%ax
 288:	66 90                	xchg   %ax,%ax
 28a:	66 90                	xchg   %ax,%ax
 28c:	66 90                	xchg   %ax,%ax
 28e:	66 90                	xchg   %ax,%ax

00000290 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 290:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 291:	31 c0                	xor    %eax,%eax
{
 293:	89 e5                	mov    %esp,%ebp
 295:	53                   	push   %ebx
 296:	8b 4d 08             	mov    0x8(%ebp),%ecx
 299:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 2a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2a7:	83 c0 01             	add    $0x1,%eax
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strcpy+0x10>
    ;
  return os;
}
 2ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b1:	89 c8                	mov    %ecx,%eax
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    
 2b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ca:	0f b6 01             	movzbl (%ecx),%eax
 2cd:	0f b6 1a             	movzbl (%edx),%ebx
 2d0:	84 c0                	test   %al,%al
 2d2:	75 1d                	jne    2f1 <strcmp+0x31>
 2d4:	eb 2a                	jmp    300 <strcmp+0x40>
 2d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
 2e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2e4:	83 c1 01             	add    $0x1,%ecx
 2e7:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
 2ea:	0f b6 1a             	movzbl (%edx),%ebx
  while(*p && *p == *q)
 2ed:	84 c0                	test   %al,%al
 2ef:	74 0f                	je     300 <strcmp+0x40>
 2f1:	38 d8                	cmp    %bl,%al
 2f3:	74 eb                	je     2e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2f5:	29 d8                	sub    %ebx,%eax
}
 2f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2fa:	c9                   	leave  
 2fb:	c3                   	ret    
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 300:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 302:	29 d8                	sub    %ebx,%eax
}
 304:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 307:	c9                   	leave  
 308:	c3                   	ret    
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000310 <strlen>:

uint
strlen(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 316:	80 3a 00             	cmpb   $0x0,(%edx)
 319:	74 15                	je     330 <strlen+0x20>
 31b:	31 c0                	xor    %eax,%eax
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	83 c0 01             	add    $0x1,%eax
 323:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 327:	89 c1                	mov    %eax,%ecx
 329:	75 f5                	jne    320 <strlen+0x10>
    ;
  return n;
}
 32b:	89 c8                	mov    %ecx,%eax
 32d:	5d                   	pop    %ebp
 32e:	c3                   	ret    
 32f:	90                   	nop
  for(n = 0; s[n]; n++)
 330:	31 c9                	xor    %ecx,%ecx
}
 332:	5d                   	pop    %ebp
 333:	89 c8                	mov    %ecx,%eax
 335:	c3                   	ret    
 336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 347:	8b 4d 10             	mov    0x10(%ebp),%ecx
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 d7                	mov    %edx,%edi
 34f:	fc                   	cld    
 350:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 352:	8b 7d fc             	mov    -0x4(%ebp),%edi
 355:	89 d0                	mov    %edx,%eax
 357:	c9                   	leave  
 358:	c3                   	ret    
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36a:	0f b6 10             	movzbl (%eax),%edx
 36d:	84 d2                	test   %dl,%dl
 36f:	75 12                	jne    383 <strchr+0x23>
 371:	eb 1d                	jmp    390 <strchr+0x30>
 373:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 377:	90                   	nop
 378:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 37c:	83 c0 01             	add    $0x1,%eax
 37f:	84 d2                	test   %dl,%dl
 381:	74 0d                	je     390 <strchr+0x30>
    if(*s == c)
 383:	38 d1                	cmp    %dl,%cl
 385:	75 f1                	jne    378 <strchr+0x18>
      return (char*)s;
  return 0;
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 390:	31 c0                	xor    %eax,%eax
}
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    
 394:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a5:	31 f6                	xor    %esi,%esi
{
 3a7:	53                   	push   %ebx
 3a8:	89 f3                	mov    %esi,%ebx
 3aa:	83 ec 1c             	sub    $0x1c,%esp
 3ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3b0:	eb 2f                	jmp    3e1 <gets+0x41>
 3b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3b8:	83 ec 04             	sub    $0x4,%esp
 3bb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3be:	6a 01                	push   $0x1
 3c0:	50                   	push   %eax
 3c1:	6a 00                	push   $0x0
 3c3:	e8 33 01 00 00       	call   4fb <read>
    if(cc < 1)
 3c8:	83 c4 10             	add    $0x10,%esp
 3cb:	85 c0                	test   %eax,%eax
 3cd:	7e 1c                	jle    3eb <gets+0x4b>
      break;
    buf[i++] = c;
 3cf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if(c == '\n' || c == '\r')
 3d3:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
 3d6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3d9:	3c 0a                	cmp    $0xa,%al
 3db:	74 23                	je     400 <gets+0x60>
 3dd:	3c 0d                	cmp    $0xd,%al
 3df:	74 1f                	je     400 <gets+0x60>
  for(i=0; i+1 < max; ){
 3e1:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
 3e4:	89 fe                	mov    %edi,%esi
  for(i=0; i+1 < max; ){
 3e6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e9:	7c cd                	jl     3b8 <gets+0x18>
 3eb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3f0:	c6 03 00             	movb   $0x0,(%ebx)
}
 3f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop
  buf[i] = '\0';
 400:	8b 75 08             	mov    0x8(%ebp),%esi
}
 403:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 406:	01 de                	add    %ebx,%esi
 408:	89 f3                	mov    %esi,%ebx
 40a:	c6 03 00             	movb   $0x0,(%ebx)
}
 40d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 410:	5b                   	pop    %ebx
 411:	5e                   	pop    %esi
 412:	5f                   	pop    %edi
 413:	5d                   	pop    %ebp
 414:	c3                   	ret    
 415:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <stat>:

int
stat(const char *n, struct stat *st)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	56                   	push   %esi
 424:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 425:	83 ec 08             	sub    $0x8,%esp
 428:	6a 00                	push   $0x0
 42a:	ff 75 08             	pushl  0x8(%ebp)
 42d:	e8 f1 00 00 00       	call   523 <open>
  if(fd < 0)
 432:	83 c4 10             	add    $0x10,%esp
 435:	85 c0                	test   %eax,%eax
 437:	78 27                	js     460 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	ff 75 0c             	pushl  0xc(%ebp)
 43f:	89 c3                	mov    %eax,%ebx
 441:	50                   	push   %eax
 442:	e8 f4 00 00 00       	call   53b <fstat>
  close(fd);
 447:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 44a:	89 c6                	mov    %eax,%esi
  close(fd);
 44c:	e8 ba 00 00 00       	call   50b <close>
  return r;
 451:	83 c4 10             	add    $0x10,%esp
}
 454:	8d 65 f8             	lea    -0x8(%ebp),%esp
 457:	89 f0                	mov    %esi,%eax
 459:	5b                   	pop    %ebx
 45a:	5e                   	pop    %esi
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    
 45d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 460:	be ff ff ff ff       	mov    $0xffffffff,%esi
 465:	eb ed                	jmp    454 <stat+0x34>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax

00000470 <atoi>:

int
atoi(const char *s)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 477:	0f be 02             	movsbl (%edx),%eax
 47a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 47d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 480:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 485:	77 1e                	ja     4a5 <atoi+0x35>
 487:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 490:	83 c2 01             	add    $0x1,%edx
 493:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 496:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 49a:	0f be 02             	movsbl (%edx),%eax
 49d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a0:	80 fb 09             	cmp    $0x9,%bl
 4a3:	76 eb                	jbe    490 <atoi+0x20>
  return n;
}
 4a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a8:	89 c8                	mov    %ecx,%eax
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	8b 45 10             	mov    0x10(%ebp),%eax
 4b7:	8b 55 08             	mov    0x8(%ebp),%edx
 4ba:	56                   	push   %esi
 4bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4be:	85 c0                	test   %eax,%eax
 4c0:	7e 13                	jle    4d5 <memmove+0x25>
 4c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 4c4:	89 d7                	mov    %edx,%edi
 4c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4d1:	39 f8                	cmp    %edi,%eax
 4d3:	75 fb                	jne    4d0 <memmove+0x20>
  return vdst;
}
 4d5:	5e                   	pop    %esi
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4db:	b8 01 00 00 00       	mov    $0x1,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exit>:
SYSCALL(exit)
 4e3:	b8 02 00 00 00       	mov    $0x2,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <wait>:
SYSCALL(wait)
 4eb:	b8 03 00 00 00       	mov    $0x3,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <pipe>:
SYSCALL(pipe)
 4f3:	b8 04 00 00 00       	mov    $0x4,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <read>:
SYSCALL(read)
 4fb:	b8 05 00 00 00       	mov    $0x5,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <write>:
SYSCALL(write)
 503:	b8 10 00 00 00       	mov    $0x10,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <close>:
SYSCALL(close)
 50b:	b8 15 00 00 00       	mov    $0x15,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <kill>:
SYSCALL(kill)
 513:	b8 06 00 00 00       	mov    $0x6,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exec>:
SYSCALL(exec)
 51b:	b8 07 00 00 00       	mov    $0x7,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <open>:
SYSCALL(open)
 523:	b8 0f 00 00 00       	mov    $0xf,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mknod>:
SYSCALL(mknod)
 52b:	b8 11 00 00 00       	mov    $0x11,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <unlink>:
SYSCALL(unlink)
 533:	b8 12 00 00 00       	mov    $0x12,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <fstat>:
SYSCALL(fstat)
 53b:	b8 08 00 00 00       	mov    $0x8,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <link>:
SYSCALL(link)
 543:	b8 13 00 00 00       	mov    $0x13,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mkdir>:
SYSCALL(mkdir)
 54b:	b8 14 00 00 00       	mov    $0x14,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <chdir>:
SYSCALL(chdir)
 553:	b8 09 00 00 00       	mov    $0x9,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <dup>:
SYSCALL(dup)
 55b:	b8 0a 00 00 00       	mov    $0xa,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getpid>:
SYSCALL(getpid)
 563:	b8 0b 00 00 00       	mov    $0xb,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <sbrk>:
SYSCALL(sbrk)
 56b:	b8 0c 00 00 00       	mov    $0xc,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sleep>:
SYSCALL(sleep)
 573:	b8 0d 00 00 00       	mov    $0xd,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <uptime>:
SYSCALL(uptime)
 57b:	b8 0e 00 00 00       	mov    $0xe,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <getreadcount>:
 583:	b8 16 00 00 00       	mov    $0x16,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    
 58b:	66 90                	xchg   %ax,%ax
 58d:	66 90                	xchg   %ax,%ax
 58f:	90                   	nop

00000590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 3c             	sub    $0x3c,%esp
 599:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 59c:	89 d1                	mov    %edx,%ecx
{
 59e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5a1:	85 d2                	test   %edx,%edx
 5a3:	0f 89 7f 00 00 00    	jns    628 <printint+0x98>
 5a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ad:	74 79                	je     628 <printint+0x98>
    neg = 1;
 5af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5b8:	31 db                	xor    %ebx,%ebx
 5ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5c0:	89 c8                	mov    %ecx,%eax
 5c2:	31 d2                	xor    %edx,%edx
 5c4:	89 cf                	mov    %ecx,%edi
 5c6:	f7 75 c4             	divl   -0x3c(%ebp)
 5c9:	0f b6 92 f4 09 00 00 	movzbl 0x9f4(%edx),%edx
 5d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5e1:	76 dd                	jbe    5c0 <printint+0x30>
  if(neg)
 5e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5e6:	85 c9                	test   %ecx,%ecx
 5e8:	74 0c                	je     5f6 <printint+0x66>
    buf[i++] = '-';
 5ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5fd:	eb 07                	jmp    606 <printint+0x76>
 5ff:	90                   	nop
    putc(fd, buf[i]);
 600:	0f b6 13             	movzbl (%ebx),%edx
 603:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 606:	83 ec 04             	sub    $0x4,%esp
 609:	88 55 d7             	mov    %dl,-0x29(%ebp)
 60c:	6a 01                	push   $0x1
 60e:	56                   	push   %esi
 60f:	57                   	push   %edi
 610:	e8 ee fe ff ff       	call   503 <write>
  while(--i >= 0)
 615:	83 c4 10             	add    $0x10,%esp
 618:	39 de                	cmp    %ebx,%esi
 61a:	75 e4                	jne    600 <printint+0x70>
}
 61c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 628:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 62f:	eb 87                	jmp    5b8 <printint+0x28>
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop

00000640 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 649:	8b 75 0c             	mov    0xc(%ebp),%esi
 64c:	0f b6 1e             	movzbl (%esi),%ebx
 64f:	84 db                	test   %bl,%bl
 651:	0f 84 b8 00 00 00    	je     70f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 657:	8d 45 10             	lea    0x10(%ebp),%eax
 65a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 65d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 660:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 662:	89 45 d0             	mov    %eax,-0x30(%ebp)
 665:	eb 37                	jmp    69e <printf+0x5e>
 667:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66e:	66 90                	xchg   %ax,%ax
 670:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 673:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	74 17                	je     694 <printf+0x54>
  write(fd, &c, 1);
 67d:	83 ec 04             	sub    $0x4,%esp
 680:	88 5d e7             	mov    %bl,-0x19(%ebp)
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	ff 75 08             	pushl  0x8(%ebp)
 689:	e8 75 fe ff ff       	call   503 <write>
 68e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 691:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 694:	0f b6 1e             	movzbl (%esi),%ebx
 697:	83 c6 01             	add    $0x1,%esi
 69a:	84 db                	test   %bl,%bl
 69c:	74 71                	je     70f <printf+0xcf>
    c = fmt[i] & 0xff;
 69e:	0f be cb             	movsbl %bl,%ecx
 6a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6a4:	85 d2                	test   %edx,%edx
 6a6:	74 c8                	je     670 <printf+0x30>
      }
    } else if(state == '%'){
 6a8:	83 fa 25             	cmp    $0x25,%edx
 6ab:	75 e7                	jne    694 <printf+0x54>
      if(c == 'd'){
 6ad:	83 f8 64             	cmp    $0x64,%eax
 6b0:	0f 84 9a 00 00 00    	je     750 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6bc:	83 f9 70             	cmp    $0x70,%ecx
 6bf:	74 5f                	je     720 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6c1:	83 f8 73             	cmp    $0x73,%eax
 6c4:	0f 84 d6 00 00 00    	je     7a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ca:	83 f8 63             	cmp    $0x63,%eax
 6cd:	0f 84 8d 00 00 00    	je     760 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6d3:	83 f8 25             	cmp    $0x25,%eax
 6d6:	0f 84 b4 00 00 00    	je     790 <printf+0x150>
  write(fd, &c, 1);
 6dc:	83 ec 04             	sub    $0x4,%esp
 6df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	ff 75 08             	pushl  0x8(%ebp)
 6e9:	e8 15 fe ff ff       	call   503 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6f1:	83 c4 0c             	add    $0xc,%esp
 6f4:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
 6f6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6f9:	57                   	push   %edi
 6fa:	ff 75 08             	pushl  0x8(%ebp)
 6fd:	e8 01 fe ff ff       	call   503 <write>
  for(i = 0; fmt[i]; i++){
 702:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 709:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 70b:	84 db                	test   %bl,%bl
 70d:	75 8f                	jne    69e <printf+0x5e>
    }
  }
}
 70f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 712:	5b                   	pop    %ebx
 713:	5e                   	pop    %esi
 714:	5f                   	pop    %edi
 715:	5d                   	pop    %ebp
 716:	c3                   	ret    
 717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 10 00 00 00       	mov    $0x10,%ecx
 728:	6a 00                	push   $0x0
 72a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	8b 13                	mov    (%ebx),%edx
 732:	e8 59 fe ff ff       	call   590 <printint>
        ap++;
 737:	89 d8                	mov    %ebx,%eax
 739:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73c:	31 d2                	xor    %edx,%edx
        ap++;
 73e:	83 c0 04             	add    $0x4,%eax
 741:	89 45 d0             	mov    %eax,-0x30(%ebp)
 744:	e9 4b ff ff ff       	jmp    694 <printf+0x54>
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 0a 00 00 00       	mov    $0xa,%ecx
 758:	6a 01                	push   $0x1
 75a:	eb ce                	jmp    72a <printf+0xea>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 760:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 766:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 768:	6a 01                	push   $0x1
        ap++;
 76a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 76d:	57                   	push   %edi
 76e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 771:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 774:	e8 8a fd ff ff       	call   503 <write>
        ap++;
 779:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 77c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77f:	31 d2                	xor    %edx,%edx
 781:	e9 0e ff ff ff       	jmp    694 <printf+0x54>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 790:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
 796:	e9 59 ff ff ff       	jmp    6f4 <printf+0xb4>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
        s = (char*)*ap;
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7a5:	83 c0 04             	add    $0x4,%eax
 7a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7ab:	85 db                	test   %ebx,%ebx
 7ad:	74 17                	je     7c6 <printf+0x186>
        while(*s != 0){
 7af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7b4:	84 c0                	test   %al,%al
 7b6:	0f 84 d8 fe ff ff    	je     694 <printf+0x54>
 7bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7bf:	89 de                	mov    %ebx,%esi
 7c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c4:	eb 1a                	jmp    7e0 <printf+0x1a0>
          s = "(null)";
 7c6:	bb ec 09 00 00       	mov    $0x9ec,%ebx
        while(*s != 0){
 7cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ce:	b8 28 00 00 00       	mov    $0x28,%eax
 7d3:	89 de                	mov    %ebx,%esi
 7d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7e3:	83 c6 01             	add    $0x1,%esi
 7e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e9:	6a 01                	push   $0x1
 7eb:	57                   	push   %edi
 7ec:	53                   	push   %ebx
 7ed:	e8 11 fd ff ff       	call   503 <write>
        while(*s != 0){
 7f2:	0f b6 06             	movzbl (%esi),%eax
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	84 c0                	test   %al,%al
 7fa:	75 e4                	jne    7e0 <printf+0x1a0>
      state = 0;
 7fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 7ff:	31 d2                	xor    %edx,%edx
 801:	e9 8e fe ff ff       	jmp    694 <printf+0x54>
 806:	66 90                	xchg   %ax,%ax
 808:	66 90                	xchg   %ax,%ax
 80a:	66 90                	xchg   %ax,%ax
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 24 0d 00 00       	mov    0xd24,%eax
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 81e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 828:	89 c2                	mov    %eax,%edx
 82a:	8b 00                	mov    (%eax),%eax
 82c:	39 ca                	cmp    %ecx,%edx
 82e:	73 30                	jae    860 <free+0x50>
 830:	39 c1                	cmp    %eax,%ecx
 832:	72 04                	jb     838 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	39 c2                	cmp    %eax,%edx
 836:	72 f0                	jb     828 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 838:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83e:	39 f8                	cmp    %edi,%eax
 840:	74 30                	je     872 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 842:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 845:	8b 42 04             	mov    0x4(%edx),%eax
 848:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 84b:	39 f1                	cmp    %esi,%ecx
 84d:	74 3a                	je     889 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 84f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
 851:	5b                   	pop    %ebx
  freep = p;
 852:	89 15 24 0d 00 00    	mov    %edx,0xd24
}
 858:	5e                   	pop    %esi
 859:	5f                   	pop    %edi
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	39 c2                	cmp    %eax,%edx
 862:	72 c4                	jb     828 <free+0x18>
 864:	39 c1                	cmp    %eax,%ecx
 866:	73 c0                	jae    828 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 f8                	cmp    %edi,%eax
 870:	75 d0                	jne    842 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 872:	03 70 04             	add    0x4(%eax),%esi
 875:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 878:	8b 02                	mov    (%edx),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 87f:	8b 42 04             	mov    0x4(%edx),%eax
 882:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 885:	39 f1                	cmp    %esi,%ecx
 887:	75 c6                	jne    84f <free+0x3f>
    p->s.size += bp->s.size;
 889:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 88c:	89 15 24 0d 00 00    	mov    %edx,0xd24
    p->s.size += bp->s.size;
 892:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 895:	8b 43 f8             	mov    -0x8(%ebx),%eax
 898:	89 02                	mov    %eax,(%edx)
}
 89a:	5b                   	pop    %ebx
 89b:	5e                   	pop    %esi
 89c:	5f                   	pop    %edi
 89d:	5d                   	pop    %ebp
 89e:	c3                   	ret    
 89f:	90                   	nop

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 3d 24 0d 00 00    	mov    0xd24,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 70 07             	lea    0x7(%eax),%esi
 8b5:	c1 ee 03             	shr    $0x3,%esi
 8b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8bb:	85 ff                	test   %edi,%edi
 8bd:	0f 84 ad 00 00 00    	je     970 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c3:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8c5:	8b 48 04             	mov    0x4(%eax),%ecx
 8c8:	39 f1                	cmp    %esi,%ecx
 8ca:	73 71                	jae    93d <malloc+0x9d>
 8cc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8d7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8da:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8e1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8e4:	eb 1b                	jmp    901 <malloc+0x61>
 8e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8f5:	39 f1                	cmp    %esi,%ecx
 8f7:	73 4f                	jae    948 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8f9:	8b 3d 24 0d 00 00    	mov    0xd24,%edi
 8ff:	89 d0                	mov    %edx,%eax
 901:	39 c7                	cmp    %eax,%edi
 903:	75 eb                	jne    8f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 905:	83 ec 0c             	sub    $0xc,%esp
 908:	ff 75 e4             	pushl  -0x1c(%ebp)
 90b:	e8 5b fc ff ff       	call   56b <sbrk>
  if(p == (char*)-1)
 910:	83 c4 10             	add    $0x10,%esp
 913:	83 f8 ff             	cmp    $0xffffffff,%eax
 916:	74 1b                	je     933 <malloc+0x93>
  hp->s.size = nu;
 918:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 91b:	83 ec 0c             	sub    $0xc,%esp
 91e:	83 c0 08             	add    $0x8,%eax
 921:	50                   	push   %eax
 922:	e8 e9 fe ff ff       	call   810 <free>
  return freep;
 927:	a1 24 0d 00 00       	mov    0xd24,%eax
      if((p = morecore(nunits)) == 0)
 92c:	83 c4 10             	add    $0x10,%esp
 92f:	85 c0                	test   %eax,%eax
 931:	75 bd                	jne    8f0 <malloc+0x50>
        return 0;
  }
}
 933:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 936:	31 c0                	xor    %eax,%eax
}
 938:	5b                   	pop    %ebx
 939:	5e                   	pop    %esi
 93a:	5f                   	pop    %edi
 93b:	5d                   	pop    %ebp
 93c:	c3                   	ret    
    if(p->s.size >= nunits){
 93d:	89 c2                	mov    %eax,%edx
 93f:	89 f8                	mov    %edi,%eax
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 948:	39 ce                	cmp    %ecx,%esi
 94a:	74 54                	je     9a0 <malloc+0x100>
        p->s.size -= nunits;
 94c:	29 f1                	sub    %esi,%ecx
 94e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 951:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 954:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 957:	a3 24 0d 00 00       	mov    %eax,0xd24
}
 95c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 95f:	8d 42 08             	lea    0x8(%edx),%eax
}
 962:	5b                   	pop    %ebx
 963:	5e                   	pop    %esi
 964:	5f                   	pop    %edi
 965:	5d                   	pop    %ebp
 966:	c3                   	ret    
 967:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 970:	c7 05 24 0d 00 00 28 	movl   $0xd28,0xd24
 977:	0d 00 00 
    base.s.size = 0;
 97a:	bf 28 0d 00 00       	mov    $0xd28,%edi
    base.s.ptr = freep = prevp = &base;
 97f:	c7 05 28 0d 00 00 28 	movl   $0xd28,0xd28
 986:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 98b:	c7 05 2c 0d 00 00 00 	movl   $0x0,0xd2c
 992:	00 00 00 
    if(p->s.size >= nunits){
 995:	e9 32 ff ff ff       	jmp    8cc <malloc+0x2c>
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9a0:	8b 0a                	mov    (%edx),%ecx
 9a2:	89 08                	mov    %ecx,(%eax)
 9a4:	eb b1                	jmp    957 <malloc+0xb7>

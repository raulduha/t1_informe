
user/_testsh:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00000000 <main>:
  free(cmd);
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
       f:	83 ec 10             	sub    $0x10,%esp
  if(argc != 2){
      12:	83 39 02             	cmpl   $0x2,(%ecx)
{
      15:	8b 41 04             	mov    0x4(%ecx),%eax
  if(argc != 2){
      18:	74 13                	je     2d <main+0x2d>
    printf(2, "Usage: testsh nsh\n");
      1a:	51                   	push   %ecx
      1b:	51                   	push   %ecx
      1c:	68 eb 18 00 00       	push   $0x18eb
      21:	6a 02                	push   $0x2
      23:	e8 08 13 00 00       	call   1330 <printf>
    exit();
      28:	e8 a6 11 00 00       	call   11d3 <exit>
  }
  shname = argv[1];
      2d:	8b 40 04             	mov    0x4(%eax),%eax
  
  seed += getpid();

  int ok = 1;

  t1(&ok);
      30:	8d 5d f4             	lea    -0xc(%ebp),%ebx
  shname = argv[1];
      33:	a3 9c 1f 00 00       	mov    %eax,0x1f9c
  seed += getpid();
      38:	e8 16 12 00 00       	call   1253 <getpid>
  t1(&ok);
      3d:	83 ec 0c             	sub    $0xc,%esp
  seed += getpid();
      40:	01 05 98 1f 00 00    	add    %eax,0x1f98
  t1(&ok);
      46:	53                   	push   %ebx
  int ok = 1;
      47:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  t1(&ok);
      4e:	e8 6d 05 00 00       	call   5c0 <t1>
  t2(&ok);
      53:	89 1c 24             	mov    %ebx,(%esp)
      56:	e8 d5 05 00 00       	call   630 <t2>
  t3(&ok);
      5b:	89 1c 24             	mov    %ebx,(%esp)
      5e:	e8 3d 06 00 00       	call   6a0 <t3>
  t4(&ok);
      63:	89 1c 24             	mov    %ebx,(%esp)
      66:	e8 a5 06 00 00       	call   710 <t4>
  t5(&ok);
      6b:	89 1c 24             	mov    %ebx,(%esp)
      6e:	e8 8d 08 00 00       	call   900 <t5>
  t6(&ok);
      73:	89 1c 24             	mov    %ebx,(%esp)
      76:	e8 e5 09 00 00       	call   a60 <t6>
  t7(&ok);
      7b:	89 1c 24             	mov    %ebx,(%esp)
      7e:	e8 bd 0a 00 00       	call   b40 <t7>
  t8(&ok);
      83:	89 1c 24             	mov    %ebx,(%esp)
      86:	e8 35 0c 00 00       	call   cc0 <t8>
  t9(&ok);
      8b:	89 1c 24             	mov    %ebx,(%esp)
      8e:	e8 fd 0c 00 00       	call   d90 <t9>

  if(ok){
      93:	83 c4 10             	add    $0x10,%esp
      96:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      9a:	75 16                	jne    b2 <main+0xb2>
    printf(1, "passed all tests\n");
  } else {
    printf(2, "failed some tests\n");
      9c:	50                   	push   %eax
      9d:	50                   	push   %eax
      9e:	68 10 19 00 00       	push   $0x1910
      a3:	6a 02                	push   $0x2
      a5:	e8 86 12 00 00       	call   1330 <printf>
      aa:	83 c4 10             	add    $0x10,%esp
  }
  
  exit();
      ad:	e8 21 11 00 00       	call   11d3 <exit>
    printf(1, "passed all tests\n");
      b2:	52                   	push   %edx
      b3:	52                   	push   %edx
      b4:	68 fe 18 00 00       	push   $0x18fe
      b9:	6a 01                	push   $0x1
      bb:	e8 70 12 00 00       	call   1330 <printf>
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb e8                	jmp    ad <main+0xad>
      c5:	66 90                	xchg   %ax,%ax
      c7:	66 90                	xchg   %ax,%ax
      c9:	66 90                	xchg   %ax,%ax
      cb:	66 90                	xchg   %ax,%ax
      cd:	66 90                	xchg   %ax,%ax
      cf:	90                   	nop

000000d0 <rand>:
  seed = (a * seed + c) % m;
      d0:	69 05 98 1f 00 00 6d 	imul   $0x41c64e6d,0x1f98,%eax
      d7:	4e c6 41 
      da:	05 39 30 00 00       	add    $0x3039,%eax
      df:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
      e4:	a3 98 1f 00 00       	mov    %eax,0x1f98
}
      e9:	c3                   	ret    
      ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000f0 <randstring>:
{
      f0:	55                   	push   %ebp
      f1:	89 e5                	mov    %esp,%ebp
      f3:	57                   	push   %edi
  for(int i = 0; i < n-1; i++)
      f4:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
{
      f8:	56                   	push   %esi
      f9:	53                   	push   %ebx
  for(int i = 0; i < n-1; i++)
      fa:	7e 4d                	jle    149 <randstring+0x59>
      fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
      ff:	8b 7d 0c             	mov    0xc(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     102:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
     107:	8d 7c 3b ff          	lea    -0x1(%ebx,%edi,1),%edi
     10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     10f:	90                   	nop
  seed = (a * seed + c) % m;
     110:	69 0d 98 1f 00 00 6d 	imul   $0x41c64e6d,0x1f98,%ecx
     117:	4e c6 41 
  for(int i = 0; i < n-1; i++)
     11a:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     11d:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     123:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     129:	89 c8                	mov    %ecx,%eax
  seed = (a * seed + c) % m;
     12b:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     131:	f7 e6                	mul    %esi
     133:	c1 ea 03             	shr    $0x3,%edx
     136:	6b d2 1a             	imul   $0x1a,%edx,%edx
     139:	29 d1                	sub    %edx,%ecx
     13b:	0f b6 81 98 16 00 00 	movzbl 0x1698(%ecx),%eax
     142:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     145:	39 df                	cmp    %ebx,%edi
     147:	75 c7                	jne    110 <randstring+0x20>
  buf[n-1] = '\0';
     149:	8b 45 08             	mov    0x8(%ebp),%eax
     14c:	8b 75 0c             	mov    0xc(%ebp),%esi
     14f:	c6 44 30 ff 00       	movb   $0x0,-0x1(%eax,%esi,1)
}
     154:	5b                   	pop    %ebx
     155:	5e                   	pop    %esi
     156:	5f                   	pop    %edi
     157:	5d                   	pop    %ebp
     158:	c3                   	ret    
     159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <writefile>:
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	57                   	push   %edi
     164:	56                   	push   %esi
     165:	53                   	push   %ebx
     166:	83 ec 18             	sub    $0x18,%esp
     169:	8b 7d 08             	mov    0x8(%ebp),%edi
     16c:	8b 75 0c             	mov    0xc(%ebp),%esi
  unlink(name); // since no truncation
     16f:	57                   	push   %edi
     170:	e8 ae 10 00 00       	call   1223 <unlink>
  int fd = open(name, O_CREATE|O_WRONLY);
     175:	59                   	pop    %ecx
     176:	5b                   	pop    %ebx
     177:	68 01 02 00 00       	push   $0x201
     17c:	57                   	push   %edi
     17d:	e8 91 10 00 00       	call   1213 <open>
  if(fd < 0){
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 36                	js     1bf <writefile+0x5f>
  if(write(fd, data, strlen(data)) != strlen(data)){
     189:	83 ec 0c             	sub    $0xc,%esp
     18c:	89 c3                	mov    %eax,%ebx
     18e:	56                   	push   %esi
     18f:	e8 6c 0e 00 00       	call   1000 <strlen>
     194:	83 c4 0c             	add    $0xc,%esp
     197:	50                   	push   %eax
     198:	56                   	push   %esi
     199:	53                   	push   %ebx
     19a:	e8 54 10 00 00       	call   11f3 <write>
     19f:	89 34 24             	mov    %esi,(%esp)
     1a2:	89 c7                	mov    %eax,%edi
     1a4:	e8 57 0e 00 00       	call   1000 <strlen>
     1a9:	83 c4 10             	add    $0x10,%esp
     1ac:	39 c7                	cmp    %eax,%edi
     1ae:	75 22                	jne    1d2 <writefile+0x72>
  close(fd);
     1b0:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
     1b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1b6:	5b                   	pop    %ebx
     1b7:	5e                   	pop    %esi
     1b8:	5f                   	pop    %edi
     1b9:	5d                   	pop    %ebp
  close(fd);
     1ba:	e9 3c 10 00 00       	jmp    11fb <close>
    printf(2, "testsh: could not write %s\n", name);
     1bf:	52                   	push   %edx
     1c0:	57                   	push   %edi
     1c1:	68 b3 16 00 00       	push   $0x16b3
     1c6:	6a 02                	push   $0x2
     1c8:	e8 63 11 00 00       	call   1330 <printf>
    exit();
     1cd:	e8 01 10 00 00       	call   11d3 <exit>
    printf(2, "testsh: write failed\n");
     1d2:	50                   	push   %eax
     1d3:	50                   	push   %eax
     1d4:	68 cf 16 00 00       	push   $0x16cf
     1d9:	6a 02                	push   $0x2
     1db:	e8 50 11 00 00       	call   1330 <printf>
    exit();
     1e0:	e8 ee 0f 00 00       	call   11d3 <exit>
     1e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <readfile>:
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	57                   	push   %edi
     1f4:	56                   	push   %esi
     1f5:	53                   	push   %ebx
     1f6:	83 ec 24             	sub    $0x24,%esp
     1f9:	8b 7d 08             	mov    0x8(%ebp),%edi
     1fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     1ff:	8b 75 10             	mov    0x10(%ebp),%esi
  data[0] = '\0';
     202:	c6 03 00             	movb   $0x0,(%ebx)
  int fd = open(name, 0);
     205:	6a 00                	push   $0x0
     207:	57                   	push   %edi
     208:	e8 06 10 00 00       	call   1213 <open>
  if(fd < 0){
     20d:	83 c4 10             	add    $0x10,%esp
     210:	85 c0                	test   %eax,%eax
     212:	78 34                	js     248 <readfile+0x58>
  int n = read(fd, data, max-1);
     214:	83 ec 04             	sub    $0x4,%esp
     217:	83 ee 01             	sub    $0x1,%esi
     21a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     21d:	56                   	push   %esi
     21e:	53                   	push   %ebx
     21f:	50                   	push   %eax
     220:	e8 c6 0f 00 00       	call   11eb <read>
  close(fd);
     225:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  int n = read(fd, data, max-1);
     228:	89 c6                	mov    %eax,%esi
  close(fd);
     22a:	89 14 24             	mov    %edx,(%esp)
     22d:	e8 c9 0f 00 00       	call   11fb <close>
  if(n < 0){
     232:	83 c4 10             	add    $0x10,%esp
     235:	85 f6                	test   %esi,%esi
     237:	78 2f                	js     268 <readfile+0x78>
  data[n] = '\0';
     239:	c6 04 33 00          	movb   $0x0,(%ebx,%esi,1)
}
     23d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     240:	5b                   	pop    %ebx
     241:	5e                   	pop    %esi
     242:	5f                   	pop    %edi
     243:	5d                   	pop    %ebp
     244:	c3                   	ret    
     245:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "testsh: open %s failed\n", name);
     248:	89 7d 10             	mov    %edi,0x10(%ebp)
     24b:	c7 45 0c e5 16 00 00 	movl   $0x16e5,0xc(%ebp)
    printf(2, "testsh: read %s failed\n", name);
     252:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
}
     259:	8d 65 f4             	lea    -0xc(%ebp),%esp
     25c:	5b                   	pop    %ebx
     25d:	5e                   	pop    %esi
     25e:	5f                   	pop    %edi
     25f:	5d                   	pop    %ebp
    printf(2, "testsh: read %s failed\n", name);
     260:	e9 cb 10 00 00       	jmp    1330 <printf>
     265:	8d 76 00             	lea    0x0(%esi),%esi
     268:	89 7d 10             	mov    %edi,0x10(%ebp)
     26b:	c7 45 0c fd 16 00 00 	movl   $0x16fd,0xc(%ebp)
     272:	eb de                	jmp    252 <readfile+0x62>
     274:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     27f:	90                   	nop

00000280 <strstr>:
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	57                   	push   %edi
     284:	56                   	push   %esi
     285:	53                   	push   %ebx
     286:	83 ec 08             	sub    $0x8,%esp
     289:	8b 45 0c             	mov    0xc(%ebp),%eax
     28c:	8b 75 08             	mov    0x8(%ebp),%esi
  if(small[0] == '\0')
     28f:	0f b6 08             	movzbl (%eax),%ecx
     292:	89 f7                	mov    %esi,%edi
     294:	88 4d f3             	mov    %cl,-0xd(%ebp)
     297:	84 c9                	test   %cl,%cl
     299:	74 45                	je     2e0 <strstr+0x60>
  for(int i = 0; big[i]; i++){
     29b:	0f b6 1e             	movzbl (%esi),%ebx
     29e:	84 db                	test   %bl,%bl
     2a0:	74 3c                	je     2de <strstr+0x5e>
     2a2:	83 c0 01             	add    $0x1,%eax
     2a5:	83 c6 01             	add    $0x1,%esi
     2a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
     2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2af:	90                   	nop
     2b0:	8b 55 ec             	mov    -0x14(%ebp),%edx
{
     2b3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
     2b7:	8d 7e ff             	lea    -0x1(%esi),%edi
     2ba:	89 f1                	mov    %esi,%ecx
     2bc:	eb 12                	jmp    2d0 <strstr+0x50>
     2be:	66 90                	xchg   %ax,%ax
    for(j = 0; small[j]; j++){
     2c0:	0f b6 02             	movzbl (%edx),%eax
     2c3:	83 c2 01             	add    $0x1,%edx
     2c6:	84 c0                	test   %al,%al
     2c8:	74 16                	je     2e0 <strstr+0x60>
      if(big[i+j] != small[j]){
     2ca:	0f b6 19             	movzbl (%ecx),%ebx
     2cd:	83 c1 01             	add    $0x1,%ecx
     2d0:	38 d8                	cmp    %bl,%al
     2d2:	74 ec                	je     2c0 <strstr+0x40>
  for(int i = 0; big[i]; i++){
     2d4:	0f b6 1e             	movzbl (%esi),%ebx
     2d7:	83 c6 01             	add    $0x1,%esi
     2da:	84 db                	test   %bl,%bl
     2dc:	75 d2                	jne    2b0 <strstr+0x30>
  return 0;
     2de:	31 ff                	xor    %edi,%edi
}
     2e0:	83 c4 08             	add    $0x8,%esp
     2e3:	89 f8                	mov    %edi,%eax
     2e5:	5b                   	pop    %ebx
     2e6:	5e                   	pop    %esi
     2e7:	5f                   	pop    %edi
     2e8:	5d                   	pop    %ebp
     2e9:	c3                   	ret    
     2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002f0 <one>:
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	57                   	push   %edi
     2f4:	56                   	push   %esi
     2f5:	8d bd db fe ff ff    	lea    -0x125(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     2fb:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
{
     300:	53                   	push   %ebx
     301:	8d 9d d0 fe ff ff    	lea    -0x130(%ebp),%ebx
     307:	81 ec 3c 01 00 00    	sub    $0x13c,%esp
     30d:	8b 0d 98 1f 00 00    	mov    0x1f98,%ecx
     313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     317:	90                   	nop
  seed = (a * seed + c) % m;
     318:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     31e:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     321:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     327:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     32d:	89 c8                	mov    %ecx,%eax
     32f:	f7 e6                	mul    %esi
     331:	89 c8                	mov    %ecx,%eax
     333:	c1 ea 03             	shr    $0x3,%edx
     336:	6b d2 1a             	imul   $0x1a,%edx,%edx
     339:	29 d0                	sub    %edx,%eax
     33b:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     342:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     345:	39 df                	cmp    %ebx,%edi
     347:	75 cf                	jne    318 <one+0x28>
  buf[n-1] = '\0';
     349:	c6 85 db fe ff ff 00 	movb   $0x0,-0x125(%ebp)
  for(int i = 0; i < n-1; i++)
     350:	8d 9d dc fe ff ff    	lea    -0x124(%ebp),%ebx
     356:	8d bd e7 fe ff ff    	lea    -0x119(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     35c:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
     361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  seed = (a * seed + c) % m;
     368:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     36e:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     371:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     377:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     37d:	89 c8                	mov    %ecx,%eax
     37f:	f7 e6                	mul    %esi
     381:	89 c8                	mov    %ecx,%eax
     383:	c1 ea 03             	shr    $0x3,%edx
     386:	6b d2 1a             	imul   $0x1a,%edx,%edx
     389:	29 d0                	sub    %edx,%eax
     38b:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     392:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     395:	39 df                	cmp    %ebx,%edi
     397:	75 cf                	jne    368 <one+0x78>
  writefile(infile, cmd);
     399:	83 ec 08             	sub    $0x8,%esp
     39c:	8d 85 d0 fe ff ff    	lea    -0x130(%ebp),%eax
     3a2:	ff 75 08             	pushl  0x8(%ebp)
     3a5:	50                   	push   %eax
     3a6:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
  buf[n-1] = '\0';
     3ac:	c6 85 e7 fe ff ff 00 	movb   $0x0,-0x119(%ebp)
  writefile(infile, cmd);
     3b3:	e8 a8 fd ff ff       	call   160 <writefile>
  unlink(outfile);
     3b8:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
     3be:	89 04 24             	mov    %eax,(%esp)
     3c1:	e8 5d 0e 00 00       	call   1223 <unlink>
  int pid = fork();
     3c6:	e8 00 0e 00 00       	call   11cb <fork>
  if(pid < 0){
     3cb:	83 c4 10             	add    $0x10,%esp
  int pid = fork();
     3ce:	89 c3                	mov    %eax,%ebx
  if(pid < 0){
     3d0:	85 c0                	test   %eax,%eax
     3d2:	0f 88 b8 01 00 00    	js     590 <one+0x2a0>
  if(pid == 0){
     3d8:	0f 84 b2 00 00 00    	je     490 <one+0x1a0>
  if(wait() != pid){
     3de:	e8 f8 0d 00 00       	call   11db <wait>
     3e3:	39 d8                	cmp    %ebx,%eax
     3e5:	0f 85 b8 01 00 00    	jne    5a3 <one+0x2b3>
  unlink(infile);
     3eb:	83 ec 0c             	sub    $0xc,%esp
     3ee:	8d 85 d0 fe ff ff    	lea    -0x130(%ebp),%eax
     3f4:	50                   	push   %eax
     3f5:	e8 29 0e 00 00       	call   1223 <unlink>
  readfile(outfile, out, sizeof(out));
     3fa:	83 c4 0c             	add    $0xc,%esp
     3fd:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     403:	68 00 01 00 00       	push   $0x100
     408:	50                   	push   %eax
     409:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
     40f:	50                   	push   %eax
     410:	e8 db fd ff ff       	call   1f0 <readfile>
  unlink(outfile);
     415:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
     41b:	89 04 24             	mov    %eax,(%esp)
     41e:	e8 00 0e 00 00       	call   1223 <unlink>
  if(small[0] == '\0')
     423:	8b 45 0c             	mov    0xc(%ebp),%eax
     426:	83 c4 10             	add    $0x10,%esp
     429:	0f b6 38             	movzbl (%eax),%edi
     42c:	89 f8                	mov    %edi,%eax
     42e:	84 c0                	test   %al,%al
     430:	0f 84 ba 00 00 00    	je     4f0 <one+0x200>
  for(int i = 0; big[i]; i++){
     436:	0f b6 9d e8 fe ff ff 	movzbl -0x118(%ebp),%ebx
     43d:	84 db                	test   %bl,%bl
     43f:	74 45                	je     486 <one+0x196>
     441:	8b 45 0c             	mov    0xc(%ebp),%eax
     444:	8d b5 e9 fe ff ff    	lea    -0x117(%ebp),%esi
     44a:	83 c0 01             	add    $0x1,%eax
     44d:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%ebp)
     453:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     457:	90                   	nop
    for(j = 0; small[j]; j++){
     458:	8b 95 c4 fe ff ff    	mov    -0x13c(%ebp),%edx
{
     45e:	89 f1                	mov    %esi,%ecx
     460:	89 f8                	mov    %edi,%eax
     462:	eb 14                	jmp    478 <one+0x188>
     464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(j = 0; small[j]; j++){
     468:	0f b6 02             	movzbl (%edx),%eax
     46b:	83 c2 01             	add    $0x1,%edx
     46e:	84 c0                	test   %al,%al
     470:	74 7e                	je     4f0 <one+0x200>
      if(big[i+j] != small[j]){
     472:	0f b6 19             	movzbl (%ecx),%ebx
     475:	83 c1 01             	add    $0x1,%ecx
     478:	38 d8                	cmp    %bl,%al
     47a:	74 ec                	je     468 <one+0x178>
  for(int i = 0; big[i]; i++){
     47c:	0f b6 1e             	movzbl (%esi),%ebx
     47f:	83 c6 01             	add    $0x1,%esi
     482:	84 db                	test   %bl,%bl
     484:	75 d2                	jne    458 <one+0x168>
}
     486:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0; // fail
     489:	31 c0                	xor    %eax,%eax
}
     48b:	5b                   	pop    %ebx
     48c:	5e                   	pop    %esi
     48d:	5f                   	pop    %edi
     48e:	5d                   	pop    %ebp
     48f:	c3                   	ret    
    close(0);
     490:	83 ec 0c             	sub    $0xc,%esp
     493:	6a 00                	push   $0x0
     495:	e8 61 0d 00 00       	call   11fb <close>
    if(open(infile, 0) != 0){
     49a:	58                   	pop    %eax
     49b:	8d 85 d0 fe ff ff    	lea    -0x130(%ebp),%eax
     4a1:	5a                   	pop    %edx
     4a2:	6a 00                	push   $0x0
     4a4:	50                   	push   %eax
     4a5:	e8 69 0d 00 00       	call   1213 <open>
     4aa:	83 c4 10             	add    $0x10,%esp
     4ad:	85 c0                	test   %eax,%eax
     4af:	0f 85 c8 00 00 00    	jne    57d <one+0x28d>
    close(1);
     4b5:	83 ec 0c             	sub    $0xc,%esp
     4b8:	6a 01                	push   $0x1
     4ba:	e8 3c 0d 00 00       	call   11fb <close>
    if(open(outfile, O_CREATE|O_WRONLY) != 1){
     4bf:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
     4c5:	5b                   	pop    %ebx
     4c6:	5e                   	pop    %esi
     4c7:	68 01 02 00 00       	push   $0x201
     4cc:	50                   	push   %eax
     4cd:	e8 41 0d 00 00       	call   1213 <open>
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	83 f8 01             	cmp    $0x1,%eax
     4d8:	74 64                	je     53e <one+0x24e>
      printf(2, "testsh: child open != 1\n");
     4da:	83 ec 08             	sub    $0x8,%esp
     4dd:	68 45 17 00 00       	push   $0x1745
     4e2:	6a 02                	push   $0x2
     4e4:	e8 47 0e 00 00       	call   1330 <printf>
      exit();
     4e9:	e8 e5 0c 00 00       	call   11d3 <exit>
     4ee:	66 90                	xchg   %ax,%ax
    if(tight && strlen(out) > strlen(expect) + 10){
     4f0:	8b 45 10             	mov    0x10(%ebp),%eax
     4f3:	85 c0                	test   %eax,%eax
     4f5:	75 0d                	jne    504 <one+0x214>
    return 1; // pass
     4f7:	b8 01 00 00 00       	mov    $0x1,%eax
}
     4fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4ff:	5b                   	pop    %ebx
     500:	5e                   	pop    %esi
     501:	5f                   	pop    %edi
     502:	5d                   	pop    %ebp
     503:	c3                   	ret    
    if(tight && strlen(out) > strlen(expect) + 10){
     504:	83 ec 0c             	sub    $0xc,%esp
     507:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
     50d:	50                   	push   %eax
     50e:	e8 ed 0a 00 00       	call   1000 <strlen>
     513:	5a                   	pop    %edx
     514:	ff 75 0c             	pushl  0xc(%ebp)
     517:	89 c3                	mov    %eax,%ebx
     519:	e8 e2 0a 00 00       	call   1000 <strlen>
     51e:	83 c4 10             	add    $0x10,%esp
     521:	83 c0 0a             	add    $0xa,%eax
     524:	39 c3                	cmp    %eax,%ebx
     526:	76 cf                	jbe    4f7 <one+0x207>
      printf(2, "testsh: saw expected output, but too much else as well\n");
     528:	83 ec 08             	sub    $0x8,%esp
     52b:	68 48 19 00 00       	push   $0x1948
     530:	6a 02                	push   $0x2
     532:	e8 f9 0d 00 00       	call   1330 <printf>
      return 0; // fail
     537:	83 c4 10             	add    $0x10,%esp
     53a:	31 c0                	xor    %eax,%eax
     53c:	eb be                	jmp    4fc <one+0x20c>
    argv[0] = shname;
     53e:	a1 9c 1f 00 00       	mov    0x1f9c,%eax
    exec(shname, argv);
     543:	83 ec 08             	sub    $0x8,%esp
     546:	8d 95 e8 fe ff ff    	lea    -0x118(%ebp),%edx
    argv[1] = 0;
     54c:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
     553:	00 00 00 
    exec(shname, argv);
     556:	52                   	push   %edx
     557:	50                   	push   %eax
    argv[0] = shname;
     558:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
    exec(shname, argv);
     55e:	e8 a8 0c 00 00       	call   120b <exec>
    printf(2, "testsh: exec %s failed\n", shname);
     563:	83 c4 0c             	add    $0xc,%esp
     566:	ff 35 9c 1f 00 00    	pushl  0x1f9c
     56c:	68 5e 17 00 00       	push   $0x175e
     571:	6a 02                	push   $0x2
     573:	e8 b8 0d 00 00       	call   1330 <printf>
    exit();
     578:	e8 56 0c 00 00       	call   11d3 <exit>
      printf(2, "testsh: child open != 0\n");
     57d:	57                   	push   %edi
     57e:	57                   	push   %edi
     57f:	68 2c 17 00 00       	push   $0x172c
     584:	6a 02                	push   $0x2
     586:	e8 a5 0d 00 00       	call   1330 <printf>
      exit();
     58b:	e8 43 0c 00 00       	call   11d3 <exit>
    printf(2, "testsh: fork() failed\n");
     590:	51                   	push   %ecx
     591:	51                   	push   %ecx
     592:	68 15 17 00 00       	push   $0x1715
     597:	6a 02                	push   $0x2
     599:	e8 92 0d 00 00       	call   1330 <printf>
    exit();
     59e:	e8 30 0c 00 00       	call   11d3 <exit>
    printf(2, "testsh: unexpected wait() return\n");
     5a3:	51                   	push   %ecx
     5a4:	51                   	push   %ecx
     5a5:	68 24 19 00 00       	push   $0x1924
     5aa:	6a 02                	push   $0x2
     5ac:	e8 7f 0d 00 00       	call   1330 <printf>
    exit();
     5b1:	e8 1d 0c 00 00       	call   11d3 <exit>
     5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5bd:	8d 76 00             	lea    0x0(%esi),%esi

000005c0 <t1>:
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "simple echo: ");
     5c6:	68 76 17 00 00       	push   $0x1776
     5cb:	6a 01                	push   $0x1
     5cd:	e8 5e 0d 00 00       	call   1330 <printf>
  if(one("echo hello goodbye\n", "hello goodbye", 1) == 0){
     5d2:	83 c4 0c             	add    $0xc,%esp
     5d5:	6a 01                	push   $0x1
     5d7:	68 84 17 00 00       	push   $0x1784
     5dc:	68 92 17 00 00       	push   $0x1792
     5e1:	e8 0a fd ff ff       	call   2f0 <one>
     5e6:	83 c4 10             	add    $0x10,%esp
     5e9:	85 c0                	test   %eax,%eax
     5eb:	75 23                	jne    610 <t1+0x50>
    printf(2, "FAIL\n");
     5ed:	83 ec 08             	sub    $0x8,%esp
     5f0:	68 a6 17 00 00       	push   $0x17a6
     5f5:	6a 02                	push   $0x2
     5f7:	e8 34 0d 00 00       	call   1330 <printf>
    *ok = 0;
     5fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
     5ff:	83 c4 10             	add    $0x10,%esp
    *ok = 0;
     602:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     608:	c9                   	leave  
     609:	c3                   	ret    
     60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "PASS\n");
     610:	83 ec 08             	sub    $0x8,%esp
     613:	68 ac 17 00 00       	push   $0x17ac
     618:	6a 01                	push   $0x1
     61a:	e8 11 0d 00 00       	call   1330 <printf>
     61f:	83 c4 10             	add    $0x10,%esp
}
     622:	c9                   	leave  
     623:	c3                   	ret    
     624:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     62f:	90                   	nop

00000630 <t2>:
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	83 ec 10             	sub    $0x10,%esp
  printf(1, "simple grep: ");
     636:	68 b2 17 00 00       	push   $0x17b2
     63b:	6a 01                	push   $0x1
     63d:	e8 ee 0c 00 00       	call   1330 <printf>
  if(one("grep constitute README\n", "The code in the files that constitute xv6 is", 1) == 0){
     642:	83 c4 0c             	add    $0xc,%esp
     645:	6a 01                	push   $0x1
     647:	68 80 19 00 00       	push   $0x1980
     64c:	68 c0 17 00 00       	push   $0x17c0
     651:	e8 9a fc ff ff       	call   2f0 <one>
     656:	83 c4 10             	add    $0x10,%esp
     659:	85 c0                	test   %eax,%eax
     65b:	75 23                	jne    680 <t2+0x50>
    printf(2, "FAIL\n");
     65d:	83 ec 08             	sub    $0x8,%esp
     660:	68 a6 17 00 00       	push   $0x17a6
     665:	6a 02                	push   $0x2
     667:	e8 c4 0c 00 00       	call   1330 <printf>
    *ok = 0;
     66c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     66f:	83 c4 10             	add    $0x10,%esp
    *ok = 0;
     672:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     678:	c9                   	leave  
     679:	c3                   	ret    
     67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "PASS\n");
     680:	83 ec 08             	sub    $0x8,%esp
     683:	68 ac 17 00 00       	push   $0x17ac
     688:	6a 01                	push   $0x1
     68a:	e8 a1 0c 00 00       	call   1330 <printf>
     68f:	83 c4 10             	add    $0x10,%esp
}
     692:	c9                   	leave  
     693:	c3                   	ret    
     694:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     69b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     69f:	90                   	nop

000006a0 <t3>:
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "two commands: ");
     6a6:	68 d8 17 00 00       	push   $0x17d8
     6ab:	6a 01                	push   $0x1
     6ad:	e8 7e 0c 00 00       	call   1330 <printf>
  if(one("echo x\necho goodbye\n", "goodbye", 1) == 0){
     6b2:	83 c4 0c             	add    $0xc,%esp
     6b5:	6a 01                	push   $0x1
     6b7:	68 8a 17 00 00       	push   $0x178a
     6bc:	68 e7 17 00 00       	push   $0x17e7
     6c1:	e8 2a fc ff ff       	call   2f0 <one>
     6c6:	83 c4 10             	add    $0x10,%esp
     6c9:	85 c0                	test   %eax,%eax
     6cb:	75 23                	jne    6f0 <t3+0x50>
    printf(2, "FAIL\n");
     6cd:	83 ec 08             	sub    $0x8,%esp
     6d0:	68 a6 17 00 00       	push   $0x17a6
     6d5:	6a 02                	push   $0x2
     6d7:	e8 54 0c 00 00       	call   1330 <printf>
    *ok = 0;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
}
     6df:	83 c4 10             	add    $0x10,%esp
    *ok = 0;
     6e2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     6e8:	c9                   	leave  
     6e9:	c3                   	ret    
     6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "PASS\n");
     6f0:	83 ec 08             	sub    $0x8,%esp
     6f3:	68 ac 17 00 00       	push   $0x17ac
     6f8:	6a 01                	push   $0x1
     6fa:	e8 31 0c 00 00       	call   1330 <printf>
     6ff:	83 c4 10             	add    $0x10,%esp
}
     702:	c9                   	leave  
     703:	c3                   	ret    
     704:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     70f:	90                   	nop

00000710 <t4>:
{
     710:	55                   	push   %ebp
     711:	89 e5                	mov    %esp,%ebp
     713:	57                   	push   %edi
     714:	56                   	push   %esi
     715:	8d bd 53 ff ff ff    	lea    -0xad(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     71b:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
{
     720:	53                   	push   %ebx
     721:	8d 9d 48 ff ff ff    	lea    -0xb8(%ebp),%ebx
     727:	81 ec b4 00 00 00    	sub    $0xb4,%esp
  printf(1, "output redirection: ");
     72d:	68 fc 17 00 00       	push   $0x17fc
     732:	6a 01                	push   $0x1
     734:	e8 f7 0b 00 00       	call   1330 <printf>
  for(int i = 0; i < n-1; i++)
     739:	8b 0d 98 1f 00 00    	mov    0x1f98,%ecx
     73f:	83 c4 10             	add    $0x10,%esp
     742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  seed = (a * seed + c) % m;
     748:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     74e:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     751:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     757:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     75d:	89 c8                	mov    %ecx,%eax
     75f:	f7 e6                	mul    %esi
     761:	89 c8                	mov    %ecx,%eax
     763:	c1 ea 03             	shr    $0x3,%edx
     766:	6b d2 1a             	imul   $0x1a,%edx,%edx
     769:	29 d0                	sub    %edx,%eax
     76b:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     772:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     775:	39 df                	cmp    %ebx,%edi
     777:	75 cf                	jne    748 <t4+0x38>
  buf[n-1] = '\0';
     779:	c6 85 53 ff ff ff 00 	movb   $0x0,-0xad(%ebp)
  for(int i = 0; i < n-1; i++)
     780:	8d b5 58 ff ff ff    	lea    -0xa8(%ebp),%esi
     786:	8d bd 63 ff ff ff    	lea    -0x9d(%ebp),%edi
     78c:	89 f3                	mov    %esi,%ebx
     78e:	66 90                	xchg   %ax,%ax
  seed = (a * seed + c) % m;
     790:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     796:	b8 4f ec c4 4e       	mov    $0x4ec4ec4f,%eax
  for(int i = 0; i < n-1; i++)
     79b:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     79e:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     7a4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     7aa:	f7 e1                	mul    %ecx
     7ac:	89 c8                	mov    %ecx,%eax
     7ae:	c1 ea 03             	shr    $0x3,%edx
     7b1:	6b d2 1a             	imul   $0x1a,%edx,%edx
     7b4:	29 d0                	sub    %edx,%eax
     7b6:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     7bd:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     7c0:	39 df                	cmp    %ebx,%edi
     7c2:	75 cc                	jne    790 <t4+0x80>
  strcpy(cmd, "echo ");
     7c4:	83 ec 08             	sub    $0x8,%esp
     7c7:	8d 9d 68 ff ff ff    	lea    -0x98(%ebp),%ebx
     7cd:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
     7d3:	68 11 18 00 00       	push   $0x1811
     7d8:	53                   	push   %ebx
  buf[n-1] = '\0';
     7d9:	c6 85 63 ff ff ff 00 	movb   $0x0,-0x9d(%ebp)
  strcpy(cmd, "echo ");
     7e0:	e8 9b 07 00 00       	call   f80 <strcpy>
  strcpy(cmd+strlen(cmd), data);
     7e5:	89 1c 24             	mov    %ebx,(%esp)
     7e8:	e8 13 08 00 00       	call   1000 <strlen>
     7ed:	5a                   	pop    %edx
     7ee:	59                   	pop    %ecx
     7ef:	56                   	push   %esi
     7f0:	01 d8                	add    %ebx,%eax
     7f2:	50                   	push   %eax
     7f3:	e8 88 07 00 00       	call   f80 <strcpy>
  strcpy(cmd+strlen(cmd), " > ");
     7f8:	89 1c 24             	mov    %ebx,(%esp)
     7fb:	e8 00 08 00 00       	call   1000 <strlen>
     800:	5f                   	pop    %edi
     801:	5a                   	pop    %edx
     802:	68 17 18 00 00       	push   $0x1817
     807:	01 d8                	add    %ebx,%eax
     809:	50                   	push   %eax
     80a:	e8 71 07 00 00       	call   f80 <strcpy>
  strcpy(cmd+strlen(cmd), file);
     80f:	89 1c 24             	mov    %ebx,(%esp)
     812:	e8 e9 07 00 00       	call   1000 <strlen>
     817:	59                   	pop    %ecx
     818:	5f                   	pop    %edi
     819:	8d bd 48 ff ff ff    	lea    -0xb8(%ebp),%edi
     81f:	01 d8                	add    %ebx,%eax
     821:	57                   	push   %edi
     822:	50                   	push   %eax
     823:	e8 58 07 00 00       	call   f80 <strcpy>
  strcpy(cmd+strlen(cmd), "\n");
     828:	89 1c 24             	mov    %ebx,(%esp)
     82b:	e8 d0 07 00 00       	call   1000 <strlen>
     830:	5a                   	pop    %edx
     831:	59                   	pop    %ecx
     832:	68 43 17 00 00       	push   $0x1743
     837:	01 d8                	add    %ebx,%eax
     839:	50                   	push   %eax
     83a:	e8 41 07 00 00       	call   f80 <strcpy>
  if(one(cmd, "", 1) == 0){
     83f:	83 c4 0c             	add    $0xc,%esp
     842:	6a 01                	push   $0x1
     844:	68 44 17 00 00       	push   $0x1744
     849:	53                   	push   %ebx
     84a:	e8 a1 fa ff ff       	call   2f0 <one>
     84f:	83 c4 10             	add    $0x10,%esp
     852:	85 c0                	test   %eax,%eax
     854:	74 58                	je     8ae <t4+0x19e>
    readfile(file, buf, sizeof(buf));
     856:	83 ec 04             	sub    $0x4,%esp
     859:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
     85f:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     862:	6a 40                	push   $0x40
     864:	53                   	push   %ebx
     865:	50                   	push   %eax
     866:	e8 85 f9 ff ff       	call   1f0 <readfile>
  if(small[0] == '\0')
     86b:	0f b6 bd 58 ff ff ff 	movzbl -0xa8(%ebp),%edi
     872:	83 c4 10             	add    $0x10,%esp
     875:	89 f8                	mov    %edi,%eax
     877:	84 c0                	test   %al,%al
     879:	74 65                	je     8e0 <t4+0x1d0>
  for(int i = 0; big[i]; i++){
     87b:	0f b6 4d a8          	movzbl -0x58(%ebp),%ecx
     87f:	84 c9                	test   %cl,%cl
     881:	74 2b                	je     8ae <t4+0x19e>
     883:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     887:	90                   	nop
{
     888:	89 fa                	mov    %edi,%edx
    for(j = 0; small[j]; j++){
     88a:	31 c0                	xor    %eax,%eax
     88c:	eb 11                	jmp    89f <t4+0x18f>
     88e:	66 90                	xchg   %ax,%ax
     890:	83 c0 01             	add    $0x1,%eax
     893:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
     897:	84 d2                	test   %dl,%dl
     899:	74 45                	je     8e0 <t4+0x1d0>
      if(big[i+j] != small[j]){
     89b:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
     89f:	38 ca                	cmp    %cl,%dl
     8a1:	74 ed                	je     890 <t4+0x180>
  for(int i = 0; big[i]; i++){
     8a3:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
     8a7:	83 c3 01             	add    $0x1,%ebx
     8aa:	84 c9                	test   %cl,%cl
     8ac:	75 da                	jne    888 <t4+0x178>
      printf(2, "FAIL\n");
     8ae:	83 ec 08             	sub    $0x8,%esp
     8b1:	68 a6 17 00 00       	push   $0x17a6
     8b6:	6a 02                	push   $0x2
     8b8:	e8 73 0a 00 00       	call   1330 <printf>
      *ok = 0;
     8bd:	8b 45 08             	mov    0x8(%ebp),%eax
     8c0:	83 c4 10             	add    $0x10,%esp
     8c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  unlink(file);
     8c9:	83 ec 0c             	sub    $0xc,%esp
     8cc:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
     8d2:	50                   	push   %eax
     8d3:	e8 4b 09 00 00       	call   1223 <unlink>
}
     8d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8db:	5b                   	pop    %ebx
     8dc:	5e                   	pop    %esi
     8dd:	5f                   	pop    %edi
     8de:	5d                   	pop    %ebp
     8df:	c3                   	ret    
      printf(2, "PASS\n");
     8e0:	83 ec 08             	sub    $0x8,%esp
     8e3:	68 ac 17 00 00       	push   $0x17ac
     8e8:	6a 02                	push   $0x2
     8ea:	e8 41 0a 00 00       	call   1330 <printf>
     8ef:	83 c4 10             	add    $0x10,%esp
     8f2:	eb d5                	jmp    8c9 <t4+0x1b9>
     8f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     8ff:	90                   	nop

00000900 <t5>:
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	8d 7d 93             	lea    -0x6d(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     908:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
{
     90d:	53                   	push   %ebx
     90e:	8d 5d 88             	lea    -0x78(%ebp),%ebx
     911:	83 ec 74             	sub    $0x74,%esp
  printf(1, "input redirection: ");
     914:	68 1b 18 00 00       	push   $0x181b
     919:	6a 01                	push   $0x1
     91b:	e8 10 0a 00 00       	call   1330 <printf>
  for(int i = 0; i < n-1; i++)
     920:	8b 0d 98 1f 00 00    	mov    0x1f98,%ecx
     926:	83 c4 10             	add    $0x10,%esp
     929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  seed = (a * seed + c) % m;
     930:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     936:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     939:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     93f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     945:	89 c8                	mov    %ecx,%eax
     947:	f7 e6                	mul    %esi
     949:	89 c8                	mov    %ecx,%eax
     94b:	c1 ea 03             	shr    $0x3,%edx
     94e:	6b d2 1a             	imul   $0x1a,%edx,%edx
     951:	29 d0                	sub    %edx,%eax
     953:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     95a:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     95d:	39 fb                	cmp    %edi,%ebx
     95f:	75 cf                	jne    930 <t5+0x30>
  buf[n-1] = '\0';
     961:	c6 45 93 00          	movb   $0x0,-0x6d(%ebp)
  for(int i = 0; i < n-1; i++)
     965:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     968:	8d 7d b3             	lea    -0x4d(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     96b:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
  seed = (a * seed + c) % m;
     970:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     976:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     979:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     97f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     985:	89 c8                	mov    %ecx,%eax
     987:	f7 e6                	mul    %esi
     989:	89 c8                	mov    %ecx,%eax
     98b:	c1 ea 03             	shr    $0x3,%edx
     98e:	6b d2 1a             	imul   $0x1a,%edx,%edx
     991:	29 d0                	sub    %edx,%eax
     993:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     99a:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     99d:	39 df                	cmp    %ebx,%edi
     99f:	75 cf                	jne    970 <t5+0x70>
  writefile(file, data);
     9a1:	83 ec 08             	sub    $0x8,%esp
     9a4:	8d 45 a8             	lea    -0x58(%ebp),%eax
  strcpy(cmd, "cat < ");
     9a7:	8d 5d c8             	lea    -0x38(%ebp),%ebx
     9aa:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
  writefile(file, data);
     9b0:	50                   	push   %eax
     9b1:	8d 45 88             	lea    -0x78(%ebp),%eax
     9b4:	50                   	push   %eax
  buf[n-1] = '\0';
     9b5:	c6 45 b3 00          	movb   $0x0,-0x4d(%ebp)
  writefile(file, data);
     9b9:	e8 a2 f7 ff ff       	call   160 <writefile>
  strcpy(cmd, "cat < ");
     9be:	58                   	pop    %eax
     9bf:	5a                   	pop    %edx
     9c0:	68 2f 18 00 00       	push   $0x182f
     9c5:	53                   	push   %ebx
     9c6:	e8 b5 05 00 00       	call   f80 <strcpy>
  strcpy(cmd+strlen(cmd), file);
     9cb:	89 1c 24             	mov    %ebx,(%esp)
     9ce:	e8 2d 06 00 00       	call   1000 <strlen>
     9d3:	59                   	pop    %ecx
     9d4:	5e                   	pop    %esi
     9d5:	8d 75 88             	lea    -0x78(%ebp),%esi
     9d8:	01 d8                	add    %ebx,%eax
     9da:	56                   	push   %esi
     9db:	50                   	push   %eax
     9dc:	e8 9f 05 00 00       	call   f80 <strcpy>
  strcpy(cmd+strlen(cmd), "\n");
     9e1:	89 1c 24             	mov    %ebx,(%esp)
     9e4:	e8 17 06 00 00       	call   1000 <strlen>
     9e9:	5f                   	pop    %edi
     9ea:	5a                   	pop    %edx
     9eb:	68 43 17 00 00       	push   $0x1743
     9f0:	01 d8                	add    %ebx,%eax
     9f2:	50                   	push   %eax
     9f3:	e8 88 05 00 00       	call   f80 <strcpy>
  if(one(cmd, data, 1) == 0){
     9f8:	83 c4 0c             	add    $0xc,%esp
     9fb:	8d 45 a8             	lea    -0x58(%ebp),%eax
     9fe:	6a 01                	push   $0x1
     a00:	50                   	push   %eax
     a01:	53                   	push   %ebx
     a02:	e8 e9 f8 ff ff       	call   2f0 <one>
     a07:	83 c4 10             	add    $0x10,%esp
     a0a:	85 c0                	test   %eax,%eax
     a0c:	75 32                	jne    a40 <t5+0x140>
    printf(2, "FAIL\n");
     a0e:	83 ec 08             	sub    $0x8,%esp
     a11:	68 a6 17 00 00       	push   $0x17a6
     a16:	6a 02                	push   $0x2
     a18:	e8 13 09 00 00       	call   1330 <printf>
    *ok = 0;
     a1d:	8b 45 08             	mov    0x8(%ebp),%eax
     a20:	83 c4 10             	add    $0x10,%esp
     a23:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  unlink(file);
     a29:	83 ec 0c             	sub    $0xc,%esp
     a2c:	8d 45 88             	lea    -0x78(%ebp),%eax
     a2f:	50                   	push   %eax
     a30:	e8 ee 07 00 00       	call   1223 <unlink>
}
     a35:	83 c4 10             	add    $0x10,%esp
     a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a3b:	5b                   	pop    %ebx
     a3c:	5e                   	pop    %esi
     a3d:	5f                   	pop    %edi
     a3e:	5d                   	pop    %ebp
     a3f:	c3                   	ret    
    printf(1, "PASS\n");
     a40:	83 ec 08             	sub    $0x8,%esp
     a43:	68 ac 17 00 00       	push   $0x17ac
     a48:	6a 01                	push   $0x1
     a4a:	e8 e1 08 00 00       	call   1330 <printf>
     a4f:	83 c4 10             	add    $0x10,%esp
     a52:	eb d5                	jmp    a29 <t5+0x129>
     a54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a5f:	90                   	nop

00000a60 <t6>:
{
     a60:	55                   	push   %ebp
     a61:	89 e5                	mov    %esp,%ebp
     a63:	56                   	push   %esi
     a64:	53                   	push   %ebx
     a65:	83 ec 48             	sub    $0x48,%esp
     a68:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "both redirections: ");
     a6b:	68 36 18 00 00       	push   $0x1836
     a70:	6a 01                	push   $0x1
     a72:	e8 b9 08 00 00       	call   1330 <printf>
  unlink("testsh.out");
     a77:	c7 04 24 4a 18 00 00 	movl   $0x184a,(%esp)
     a7e:	e8 a0 07 00 00       	call   1223 <unlink>
  if(one("grep pointers < README > testsh.out\n", "", 1) == 0){
     a83:	83 c4 0c             	add    $0xc,%esp
     a86:	6a 01                	push   $0x1
     a88:	68 44 17 00 00       	push   $0x1744
     a8d:	68 b0 19 00 00       	push   $0x19b0
     a92:	e8 59 f8 ff ff       	call   2f0 <one>
     a97:	83 c4 10             	add    $0x10,%esp
     a9a:	85 c0                	test   %eax,%eax
     a9c:	74 53                	je     af1 <t6+0x91>
    readfile("testsh.out", buf, sizeof(buf));
     a9e:	83 ec 04             	sub    $0x4,%esp
     aa1:	8d 75 b8             	lea    -0x48(%ebp),%esi
     aa4:	6a 40                	push   $0x40
     aa6:	56                   	push   %esi
     aa7:	68 4a 18 00 00       	push   $0x184a
     aac:	e8 3f f7 ff ff       	call   1f0 <readfile>
  for(int i = 0; big[i]; i++){
     ab1:	0f b6 4d b8          	movzbl -0x48(%ebp),%ecx
     ab5:	83 c4 10             	add    $0x10,%esp
     ab8:	84 c9                	test   %cl,%cl
     aba:	74 35                	je     af1 <t6+0x91>
     abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(j = 0; small[j]; j++){
     ac0:	ba 70 00 00 00       	mov    $0x70,%edx
     ac5:	31 c0                	xor    %eax,%eax
     ac7:	eb 19                	jmp    ae2 <t6+0x82>
     ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ad0:	0f b6 90 d9 19 00 00 	movzbl 0x19d9(%eax),%edx
     ad7:	83 c0 01             	add    $0x1,%eax
     ada:	84 d2                	test   %dl,%dl
     adc:	74 42                	je     b20 <t6+0xc0>
      if(big[i+j] != small[j]){
     ade:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
     ae2:	38 ca                	cmp    %cl,%dl
     ae4:	74 ea                	je     ad0 <t6+0x70>
  for(int i = 0; big[i]; i++){
     ae6:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
     aea:	83 c6 01             	add    $0x1,%esi
     aed:	84 c9                	test   %cl,%cl
     aef:	75 cf                	jne    ac0 <t6+0x60>
      printf(2, "FAIL\n");
     af1:	83 ec 08             	sub    $0x8,%esp
     af4:	68 a6 17 00 00       	push   $0x17a6
     af9:	6a 02                	push   $0x2
     afb:	e8 30 08 00 00       	call   1330 <printf>
      *ok = 0;
     b00:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     b06:	83 c4 10             	add    $0x10,%esp
  unlink("testsh.out");
     b09:	c7 45 08 4a 18 00 00 	movl   $0x184a,0x8(%ebp)
}
     b10:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b13:	5b                   	pop    %ebx
     b14:	5e                   	pop    %esi
     b15:	5d                   	pop    %ebp
  unlink("testsh.out");
     b16:	e9 08 07 00 00       	jmp    1223 <unlink>
     b1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b1f:	90                   	nop
      printf(1, "PASS\n");
     b20:	83 ec 08             	sub    $0x8,%esp
     b23:	68 ac 17 00 00       	push   $0x17ac
     b28:	6a 01                	push   $0x1
     b2a:	e8 01 08 00 00       	call   1330 <printf>
     b2f:	83 c4 10             	add    $0x10,%esp
     b32:	eb d5                	jmp    b09 <t6+0xa9>
     b34:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b3f:	90                   	nop

00000b40 <t7>:
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	57                   	push   %edi
     b44:	56                   	push   %esi
     b45:	8d bd 73 ff ff ff    	lea    -0x8d(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     b4b:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
{
     b50:	53                   	push   %ebx
     b51:	8d 9d 68 ff ff ff    	lea    -0x98(%ebp),%ebx
     b57:	81 ec 94 00 00 00    	sub    $0x94,%esp
  printf(1, "simple pipe: ");
     b5d:	68 55 18 00 00       	push   $0x1855
     b62:	6a 01                	push   $0x1
     b64:	e8 c7 07 00 00       	call   1330 <printf>
  for(int i = 0; i < n-1; i++)
     b69:	8b 0d 98 1f 00 00    	mov    0x1f98,%ecx
     b6f:	83 c4 10             	add    $0x10,%esp
     b72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  seed = (a * seed + c) % m;
     b78:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     b7e:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     b81:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     b87:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     b8d:	89 c8                	mov    %ecx,%eax
     b8f:	f7 e6                	mul    %esi
     b91:	89 c8                	mov    %ecx,%eax
     b93:	c1 ea 03             	shr    $0x3,%edx
     b96:	6b d2 1a             	imul   $0x1a,%edx,%edx
     b99:	29 d0                	sub    %edx,%eax
     b9b:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     ba2:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     ba5:	39 fb                	cmp    %edi,%ebx
     ba7:	75 cf                	jne    b78 <t7+0x38>
  buf[n-1] = '\0';
     ba9:	c6 85 73 ff ff ff 00 	movb   $0x0,-0x8d(%ebp)
  for(int i = 0; i < n-1; i++)
     bb0:	8d 5d 88             	lea    -0x78(%ebp),%ebx
     bb3:	8d 7d 93             	lea    -0x6d(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     bb6:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
     bbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bbf:	90                   	nop
  seed = (a * seed + c) % m;
     bc0:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     bc6:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     bc9:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     bcf:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     bd5:	89 c8                	mov    %ecx,%eax
     bd7:	f7 e6                	mul    %esi
     bd9:	89 c8                	mov    %ecx,%eax
     bdb:	c1 ea 03             	shr    $0x3,%edx
     bde:	6b d2 1a             	imul   $0x1a,%edx,%edx
     be1:	29 d0                	sub    %edx,%eax
     be3:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     bea:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     bed:	39 df                	cmp    %ebx,%edi
     bef:	75 cf                	jne    bc0 <t7+0x80>
  writefile(name, data);
     bf1:	83 ec 08             	sub    $0x8,%esp
     bf4:	8d 45 88             	lea    -0x78(%ebp),%eax
  strcpy(cmd, "cat ");
     bf7:	8d 5d a8             	lea    -0x58(%ebp),%ebx
     bfa:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
  writefile(name, data);
     c00:	50                   	push   %eax
     c01:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
     c07:	50                   	push   %eax
  buf[n-1] = '\0';
     c08:	c6 45 93 00          	movb   $0x0,-0x6d(%ebp)
  writefile(name, data);
     c0c:	e8 4f f5 ff ff       	call   160 <writefile>
  strcpy(cmd, "cat ");
     c11:	58                   	pop    %eax
     c12:	5a                   	pop    %edx
     c13:	68 63 18 00 00       	push   $0x1863
     c18:	53                   	push   %ebx
     c19:	e8 62 03 00 00       	call   f80 <strcpy>
  strcpy(cmd + strlen(cmd), name);
     c1e:	89 1c 24             	mov    %ebx,(%esp)
     c21:	e8 da 03 00 00       	call   1000 <strlen>
     c26:	59                   	pop    %ecx
     c27:	5e                   	pop    %esi
     c28:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
     c2e:	01 d8                	add    %ebx,%eax
     c30:	56                   	push   %esi
     c31:	50                   	push   %eax
     c32:	e8 49 03 00 00       	call   f80 <strcpy>
  strcpy(cmd + strlen(cmd), " | cat");
     c37:	89 1c 24             	mov    %ebx,(%esp)
     c3a:	e8 c1 03 00 00       	call   1000 <strlen>
     c3f:	5f                   	pop    %edi
     c40:	5a                   	pop    %edx
     c41:	68 68 18 00 00       	push   $0x1868
     c46:	01 d8                	add    %ebx,%eax
     c48:	50                   	push   %eax
     c49:	e8 32 03 00 00       	call   f80 <strcpy>
  if(one(cmd, data, 1) == 0){
     c4e:	83 c4 0c             	add    $0xc,%esp
     c51:	8d 45 88             	lea    -0x78(%ebp),%eax
     c54:	6a 01                	push   $0x1
     c56:	50                   	push   %eax
     c57:	53                   	push   %ebx
     c58:	e8 93 f6 ff ff       	call   2f0 <one>
     c5d:	83 c4 10             	add    $0x10,%esp
     c60:	85 c0                	test   %eax,%eax
     c62:	75 3c                	jne    ca0 <t7+0x160>
    printf(2, "FAIL\n");
     c64:	83 ec 08             	sub    $0x8,%esp
     c67:	68 a6 17 00 00       	push   $0x17a6
     c6c:	6a 02                	push   $0x2
     c6e:	e8 bd 06 00 00       	call   1330 <printf>
    *ok = 0;
     c73:	8b 45 08             	mov    0x8(%ebp),%eax
     c76:	83 c4 10             	add    $0x10,%esp
     c79:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  unlink(name);
     c7f:	83 ec 0c             	sub    $0xc,%esp
     c82:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
     c88:	50                   	push   %eax
     c89:	e8 95 05 00 00       	call   1223 <unlink>
}
     c8e:	83 c4 10             	add    $0x10,%esp
     c91:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c94:	5b                   	pop    %ebx
     c95:	5e                   	pop    %esi
     c96:	5f                   	pop    %edi
     c97:	5d                   	pop    %ebp
     c98:	c3                   	ret    
     c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "PASS\n");
     ca0:	83 ec 08             	sub    $0x8,%esp
     ca3:	68 ac 17 00 00       	push   $0x17ac
     ca8:	6a 01                	push   $0x1
     caa:	e8 81 06 00 00       	call   1330 <printf>
     caf:	83 c4 10             	add    $0x10,%esp
     cb2:	eb cb                	jmp    c7f <t7+0x13f>
     cb4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cbb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cbf:	90                   	nop

00000cc0 <t8>:
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	56                   	push   %esi
     cc4:	53                   	push   %ebx
     cc5:	83 ec 48             	sub    $0x48,%esp
     cc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "pipe and redirects: ");
     ccb:	68 6f 18 00 00       	push   $0x186f
     cd0:	6a 01                	push   $0x1
     cd2:	e8 59 06 00 00       	call   1330 <printf>
  if(one("grep suggestions < README | wc > testsh.out", "", 1) == 0){
     cd7:	83 c4 0c             	add    $0xc,%esp
     cda:	6a 01                	push   $0x1
     cdc:	68 44 17 00 00       	push   $0x1744
     ce1:	68 00 1a 00 00       	push   $0x1a00
     ce6:	e8 05 f6 ff ff       	call   2f0 <one>
     ceb:	83 c4 10             	add    $0x10,%esp
     cee:	85 c0                	test   %eax,%eax
     cf0:	74 4f                	je     d41 <t8+0x81>
    readfile("testsh.out", buf, sizeof(buf));
     cf2:	83 ec 04             	sub    $0x4,%esp
     cf5:	8d 75 b8             	lea    -0x48(%ebp),%esi
     cf8:	6a 40                	push   $0x40
     cfa:	56                   	push   %esi
     cfb:	68 4a 18 00 00       	push   $0x184a
     d00:	e8 eb f4 ff ff       	call   1f0 <readfile>
  for(int i = 0; big[i]; i++){
     d05:	0f b6 4d b8          	movzbl -0x48(%ebp),%ecx
     d09:	83 c4 10             	add    $0x10,%esp
     d0c:	84 c9                	test   %cl,%cl
     d0e:	74 31                	je     d41 <t8+0x81>
    for(j = 0; small[j]; j++){
     d10:	ba 31 00 00 00       	mov    $0x31,%edx
     d15:	31 c0                	xor    %eax,%eax
     d17:	eb 19                	jmp    d32 <t8+0x72>
     d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d20:	0f b6 90 85 18 00 00 	movzbl 0x1885(%eax),%edx
     d27:	83 c0 01             	add    $0x1,%eax
     d2a:	84 d2                	test   %dl,%dl
     d2c:	74 42                	je     d70 <t8+0xb0>
      if(big[i+j] != small[j]){
     d2e:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
     d32:	38 ca                	cmp    %cl,%dl
     d34:	74 ea                	je     d20 <t8+0x60>
  for(int i = 0; big[i]; i++){
     d36:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
     d3a:	83 c6 01             	add    $0x1,%esi
     d3d:	84 c9                	test   %cl,%cl
     d3f:	75 cf                	jne    d10 <t8+0x50>
      printf(2, "FAIL\n");
     d41:	83 ec 08             	sub    $0x8,%esp
     d44:	68 a6 17 00 00       	push   $0x17a6
     d49:	6a 02                	push   $0x2
     d4b:	e8 e0 05 00 00       	call   1330 <printf>
      *ok = 0;
     d50:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     d56:	83 c4 10             	add    $0x10,%esp
  unlink("testsh.out");
     d59:	c7 45 08 4a 18 00 00 	movl   $0x184a,0x8(%ebp)
}
     d60:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d63:	5b                   	pop    %ebx
     d64:	5e                   	pop    %esi
     d65:	5d                   	pop    %ebp
  unlink("testsh.out");
     d66:	e9 b8 04 00 00       	jmp    1223 <unlink>
     d6b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d6f:	90                   	nop
      printf(1, "PASS\n");
     d70:	83 ec 08             	sub    $0x8,%esp
     d73:	68 ac 17 00 00       	push   $0x17ac
     d78:	6a 01                	push   $0x1
     d7a:	e8 b1 05 00 00       	call   1330 <printf>
     d7f:	83 c4 10             	add    $0x10,%esp
     d82:	eb d5                	jmp    d59 <t8+0x99>
     d84:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d8f:	90                   	nop

00000d90 <t9>:
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	57                   	push   %edi
     d94:	56                   	push   %esi
     d95:	8d 7d d3             	lea    -0x2d(%ebp),%edi
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     d98:	be 4f ec c4 4e       	mov    $0x4ec4ec4f,%esi
{
     d9d:	53                   	push   %ebx
     d9e:	8d 5d c8             	lea    -0x38(%ebp),%ebx
     da1:	83 ec 34             	sub    $0x34,%esp
  printf(1, "lots of commands: ");
     da4:	68 8c 18 00 00       	push   $0x188c
     da9:	6a 01                	push   $0x1
     dab:	e8 80 05 00 00       	call   1330 <printf>
  for(int i = 0; i < n-1; i++)
     db0:	8b 0d 98 1f 00 00    	mov    0x1f98,%ecx
     db6:	83 c4 10             	add    $0x10,%esp
     db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  seed = (a * seed + c) % m;
     dc0:	69 c9 6d 4e c6 41    	imul   $0x41c64e6d,%ecx,%ecx
  for(int i = 0; i < n-1; i++)
     dc6:	83 c3 01             	add    $0x1,%ebx
  seed = (a * seed + c) % m;
     dc9:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     dcf:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
    buf[i] = "abcdefghijklmnopqrstuvwxyz"[rand() % 26];
     dd5:	89 c8                	mov    %ecx,%eax
     dd7:	f7 e6                	mul    %esi
     dd9:	89 c8                	mov    %ecx,%eax
     ddb:	c1 ea 03             	shr    $0x3,%edx
     dde:	6b d2 1a             	imul   $0x1a,%edx,%edx
     de1:	29 d0                	sub    %edx,%eax
     de3:	0f b6 80 98 16 00 00 	movzbl 0x1698(%eax),%eax
     dea:	88 43 ff             	mov    %al,-0x1(%ebx)
  for(int i = 0; i < n-1; i++)
     ded:	39 fb                	cmp    %edi,%ebx
     def:	75 cf                	jne    dc0 <t9+0x30>
  char *cmd = malloc(25 * 36 + 100);
     df1:	83 ec 0c             	sub    $0xc,%esp
     df4:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
     dfa:	68 e8 03 00 00       	push   $0x3e8
  buf[n-1] = '\0';
     dff:	c6 45 d3 00          	movb   $0x0,-0x2d(%ebp)
  char *cmd = malloc(25 * 36 + 100);
     e03:	e8 88 07 00 00       	call   1590 <malloc>
  if(cmd == 0){
     e08:	83 c4 10             	add    $0x10,%esp
  char *cmd = malloc(25 * 36 + 100);
     e0b:	89 c3                	mov    %eax,%ebx
  if(cmd == 0){
     e0d:	85 c0                	test   %eax,%eax
     e0f:	0f 84 58 01 00 00    	je     f6d <t9+0x1dd>
  cmd[0] = '\0';
     e15:	c6 00 00             	movb   $0x0,(%eax)
  for(int i = 0; i < 17+(rand()%6); i++){
     e18:	31 ff                	xor    %edi,%edi
     e1a:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  seed = (a * seed + c) % m;
     e1f:	69 05 98 1f 00 00 6d 	imul   $0x41c64e6d,0x1f98,%eax
     e26:	4e c6 41 
     e29:	05 39 30 00 00       	add    $0x3039,%eax
     e2e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
     e33:	a3 98 1f 00 00       	mov    %eax,0x1f98
  return seed;
     e38:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e3f:	90                   	nop
    strcpy(cmd + strlen(cmd), "echo x < README > tso\n");
     e40:	83 ec 0c             	sub    $0xc,%esp
  for(int i = 0; i < 17+(rand()%6); i++){
     e43:	83 c7 01             	add    $0x1,%edi
    strcpy(cmd + strlen(cmd), "echo x < README > tso\n");
     e46:	53                   	push   %ebx
     e47:	e8 b4 01 00 00       	call   1000 <strlen>
     e4c:	59                   	pop    %ecx
     e4d:	5a                   	pop    %edx
     e4e:	68 b6 18 00 00       	push   $0x18b6
     e53:	01 d8                	add    %ebx,%eax
     e55:	50                   	push   %eax
     e56:	e8 25 01 00 00       	call   f80 <strcpy>
    strcpy(cmd + strlen(cmd), "echo x | echo\n");
     e5b:	89 1c 24             	mov    %ebx,(%esp)
     e5e:	e8 9d 01 00 00       	call   1000 <strlen>
     e63:	59                   	pop    %ecx
     e64:	5a                   	pop    %edx
     e65:	68 cd 18 00 00       	push   $0x18cd
     e6a:	01 d8                	add    %ebx,%eax
     e6c:	50                   	push   %eax
     e6d:	e8 0e 01 00 00       	call   f80 <strcpy>
  for(int i = 0; i < 17+(rand()%6); i++){
     e72:	83 c4 10             	add    $0x10,%esp
  seed = (a * seed + c) % m;
     e75:	69 0d 98 1f 00 00 6d 	imul   $0x41c64e6d,0x1f98,%ecx
     e7c:	4e c6 41 
     e7f:	81 c1 39 30 00 00    	add    $0x3039,%ecx
     e85:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
  for(int i = 0; i < 17+(rand()%6); i++){
     e8b:	89 c8                	mov    %ecx,%eax
  seed = (a * seed + c) % m;
     e8d:	89 0d 98 1f 00 00    	mov    %ecx,0x1f98
  for(int i = 0; i < 17+(rand()%6); i++){
     e93:	f7 e6                	mul    %esi
     e95:	c1 ea 02             	shr    $0x2,%edx
     e98:	8d 04 52             	lea    (%edx,%edx,2),%eax
     e9b:	01 c0                	add    %eax,%eax
     e9d:	29 c1                	sub    %eax,%ecx
     e9f:	83 c1 11             	add    $0x11,%ecx
     ea2:	39 f9                	cmp    %edi,%ecx
     ea4:	77 9a                	ja     e40 <t9+0xb0>
  strcpy(cmd + strlen(cmd), "echo ");
     ea6:	83 ec 0c             	sub    $0xc,%esp
     ea9:	53                   	push   %ebx
     eaa:	e8 51 01 00 00       	call   1000 <strlen>
     eaf:	5a                   	pop    %edx
     eb0:	59                   	pop    %ecx
     eb1:	68 11 18 00 00       	push   $0x1811
     eb6:	01 d8                	add    %ebx,%eax
     eb8:	50                   	push   %eax
     eb9:	e8 c2 00 00 00       	call   f80 <strcpy>
  strcpy(cmd + strlen(cmd), term);
     ebe:	89 1c 24             	mov    %ebx,(%esp)
     ec1:	e8 3a 01 00 00       	call   1000 <strlen>
     ec6:	5e                   	pop    %esi
     ec7:	8d 75 c8             	lea    -0x38(%ebp),%esi
     eca:	5f                   	pop    %edi
     ecb:	01 d8                	add    %ebx,%eax
     ecd:	56                   	push   %esi
     ece:	50                   	push   %eax
     ecf:	e8 ac 00 00 00       	call   f80 <strcpy>
  strcpy(cmd + strlen(cmd), " > tso\n");
     ed4:	89 1c 24             	mov    %ebx,(%esp)
     ed7:	e8 24 01 00 00       	call   1000 <strlen>
     edc:	5a                   	pop    %edx
     edd:	59                   	pop    %ecx
     ede:	68 c5 18 00 00       	push   $0x18c5
     ee3:	01 d8                	add    %ebx,%eax
     ee5:	50                   	push   %eax
     ee6:	e8 95 00 00 00       	call   f80 <strcpy>
  strcpy(cmd + strlen(cmd), "cat < tso\n");
     eeb:	89 1c 24             	mov    %ebx,(%esp)
     eee:	e8 0d 01 00 00       	call   1000 <strlen>
     ef3:	5f                   	pop    %edi
     ef4:	5a                   	pop    %edx
     ef5:	68 dc 18 00 00       	push   $0x18dc
     efa:	01 d8                	add    %ebx,%eax
     efc:	50                   	push   %eax
     efd:	e8 7e 00 00 00       	call   f80 <strcpy>
  if(one(cmd, term, 0) == 0){
     f02:	83 c4 0c             	add    $0xc,%esp
     f05:	6a 00                	push   $0x0
     f07:	56                   	push   %esi
     f08:	53                   	push   %ebx
     f09:	e8 e2 f3 ff ff       	call   2f0 <one>
     f0e:	83 c4 10             	add    $0x10,%esp
     f11:	85 c0                	test   %eax,%eax
     f13:	74 3b                	je     f50 <t9+0x1c0>
    printf(1, "PASS\n");
     f15:	83 ec 08             	sub    $0x8,%esp
     f18:	68 ac 17 00 00       	push   $0x17ac
     f1d:	6a 01                	push   $0x1
     f1f:	e8 0c 04 00 00       	call   1330 <printf>
     f24:	83 c4 10             	add    $0x10,%esp
  unlink("tso");
     f27:	83 ec 0c             	sub    $0xc,%esp
     f2a:	68 e7 18 00 00       	push   $0x18e7
     f2f:	e8 ef 02 00 00       	call   1223 <unlink>
  free(cmd);
     f34:	89 1c 24             	mov    %ebx,(%esp)
     f37:	e8 c4 05 00 00       	call   1500 <free>
}
     f3c:	83 c4 10             	add    $0x10,%esp
     f3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f42:	5b                   	pop    %ebx
     f43:	5e                   	pop    %esi
     f44:	5f                   	pop    %edi
     f45:	5d                   	pop    %ebp
     f46:	c3                   	ret    
     f47:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f4e:	66 90                	xchg   %ax,%ax
    printf(2, "FAIL\n");
     f50:	83 ec 08             	sub    $0x8,%esp
     f53:	68 a6 17 00 00       	push   $0x17a6
     f58:	6a 02                	push   $0x2
     f5a:	e8 d1 03 00 00       	call   1330 <printf>
    *ok = 0;
     f5f:	8b 45 08             	mov    0x8(%ebp),%eax
     f62:	83 c4 10             	add    $0x10,%esp
     f65:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     f6b:	eb ba                	jmp    f27 <t9+0x197>
    printf(2, "testsh: malloc failed\n");
     f6d:	51                   	push   %ecx
     f6e:	51                   	push   %ecx
     f6f:	68 9f 18 00 00       	push   $0x189f
     f74:	6a 02                	push   $0x2
     f76:	e8 b5 03 00 00       	call   1330 <printf>
    exit();
     f7b:	e8 53 02 00 00       	call   11d3 <exit>

00000f80 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     f80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     f81:	31 c0                	xor    %eax,%eax
{
     f83:	89 e5                	mov    %esp,%ebp
     f85:	53                   	push   %ebx
     f86:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     f90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     f94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     f97:	83 c0 01             	add    $0x1,%eax
     f9a:	84 d2                	test   %dl,%dl
     f9c:	75 f2                	jne    f90 <strcpy+0x10>
    ;
  return os;
}
     f9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fa1:	89 c8                	mov    %ecx,%eax
     fa3:	c9                   	leave  
     fa4:	c3                   	ret    
     fa5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000fb0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	53                   	push   %ebx
     fb4:	8b 4d 08             	mov    0x8(%ebp),%ecx
     fb7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     fba:	0f b6 01             	movzbl (%ecx),%eax
     fbd:	0f b6 1a             	movzbl (%edx),%ebx
     fc0:	84 c0                	test   %al,%al
     fc2:	75 1d                	jne    fe1 <strcmp+0x31>
     fc4:	eb 2a                	jmp    ff0 <strcmp+0x40>
     fc6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fcd:	8d 76 00             	lea    0x0(%esi),%esi
     fd0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     fd4:	83 c1 01             	add    $0x1,%ecx
     fd7:	83 c2 01             	add    $0x1,%edx
  return (uchar)*p - (uchar)*q;
     fda:	0f b6 1a             	movzbl (%edx),%ebx
  while(*p && *p == *q)
     fdd:	84 c0                	test   %al,%al
     fdf:	74 0f                	je     ff0 <strcmp+0x40>
     fe1:	38 d8                	cmp    %bl,%al
     fe3:	74 eb                	je     fd0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     fe5:	29 d8                	sub    %ebx,%eax
}
     fe7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     fea:	c9                   	leave  
     feb:	c3                   	ret    
     fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ff0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     ff2:	29 d8                	sub    %ebx,%eax
}
     ff4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ff7:	c9                   	leave  
     ff8:	c3                   	ret    
     ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001000 <strlen>:

uint
strlen(const char *s)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1006:	80 3a 00             	cmpb   $0x0,(%edx)
    1009:	74 15                	je     1020 <strlen+0x20>
    100b:	31 c0                	xor    %eax,%eax
    100d:	8d 76 00             	lea    0x0(%esi),%esi
    1010:	83 c0 01             	add    $0x1,%eax
    1013:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1017:	89 c1                	mov    %eax,%ecx
    1019:	75 f5                	jne    1010 <strlen+0x10>
    ;
  return n;
}
    101b:	89 c8                	mov    %ecx,%eax
    101d:	5d                   	pop    %ebp
    101e:	c3                   	ret    
    101f:	90                   	nop
  for(n = 0; s[n]; n++)
    1020:	31 c9                	xor    %ecx,%ecx
}
    1022:	5d                   	pop    %ebp
    1023:	89 c8                	mov    %ecx,%eax
    1025:	c3                   	ret    
    1026:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102d:	8d 76 00             	lea    0x0(%esi),%esi

00001030 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	57                   	push   %edi
    1034:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1037:	8b 4d 10             	mov    0x10(%ebp),%ecx
    103a:	8b 45 0c             	mov    0xc(%ebp),%eax
    103d:	89 d7                	mov    %edx,%edi
    103f:	fc                   	cld    
    1040:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1042:	8b 7d fc             	mov    -0x4(%ebp),%edi
    1045:	89 d0                	mov    %edx,%eax
    1047:	c9                   	leave  
    1048:	c3                   	ret    
    1049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001050 <strchr>:

char*
strchr(const char *s, char c)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	8b 45 08             	mov    0x8(%ebp),%eax
    1056:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    105a:	0f b6 10             	movzbl (%eax),%edx
    105d:	84 d2                	test   %dl,%dl
    105f:	75 12                	jne    1073 <strchr+0x23>
    1061:	eb 1d                	jmp    1080 <strchr+0x30>
    1063:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1067:	90                   	nop
    1068:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    106c:	83 c0 01             	add    $0x1,%eax
    106f:	84 d2                	test   %dl,%dl
    1071:	74 0d                	je     1080 <strchr+0x30>
    if(*s == c)
    1073:	38 d1                	cmp    %dl,%cl
    1075:	75 f1                	jne    1068 <strchr+0x18>
      return (char*)s;
  return 0;
}
    1077:	5d                   	pop    %ebp
    1078:	c3                   	ret    
    1079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1080:	31 c0                	xor    %eax,%eax
}
    1082:	5d                   	pop    %ebp
    1083:	c3                   	ret    
    1084:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    108f:	90                   	nop

00001090 <gets>:

char*
gets(char *buf, int max)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	57                   	push   %edi
    1094:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1095:	31 f6                	xor    %esi,%esi
{
    1097:	53                   	push   %ebx
    1098:	89 f3                	mov    %esi,%ebx
    109a:	83 ec 1c             	sub    $0x1c,%esp
    109d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    10a0:	eb 2f                	jmp    10d1 <gets+0x41>
    10a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    10a8:	83 ec 04             	sub    $0x4,%esp
    10ab:	8d 45 e7             	lea    -0x19(%ebp),%eax
    10ae:	6a 01                	push   $0x1
    10b0:	50                   	push   %eax
    10b1:	6a 00                	push   $0x0
    10b3:	e8 33 01 00 00       	call   11eb <read>
    if(cc < 1)
    10b8:	83 c4 10             	add    $0x10,%esp
    10bb:	85 c0                	test   %eax,%eax
    10bd:	7e 1c                	jle    10db <gets+0x4b>
      break;
    buf[i++] = c;
    10bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    if(c == '\n' || c == '\r')
    10c3:	83 c7 01             	add    $0x1,%edi
    buf[i++] = c;
    10c6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    10c9:	3c 0a                	cmp    $0xa,%al
    10cb:	74 23                	je     10f0 <gets+0x60>
    10cd:	3c 0d                	cmp    $0xd,%al
    10cf:	74 1f                	je     10f0 <gets+0x60>
  for(i=0; i+1 < max; ){
    10d1:	83 c3 01             	add    $0x1,%ebx
    buf[i++] = c;
    10d4:	89 fe                	mov    %edi,%esi
  for(i=0; i+1 < max; ){
    10d6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    10d9:	7c cd                	jl     10a8 <gets+0x18>
    10db:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    10dd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    10e0:	c6 03 00             	movb   $0x0,(%ebx)
}
    10e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10e6:	5b                   	pop    %ebx
    10e7:	5e                   	pop    %esi
    10e8:	5f                   	pop    %edi
    10e9:	5d                   	pop    %ebp
    10ea:	c3                   	ret    
    10eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop
  buf[i] = '\0';
    10f0:	8b 75 08             	mov    0x8(%ebp),%esi
}
    10f3:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    10f6:	01 de                	add    %ebx,%esi
    10f8:	89 f3                	mov    %esi,%ebx
    10fa:	c6 03 00             	movb   $0x0,(%ebx)
}
    10fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1100:	5b                   	pop    %ebx
    1101:	5e                   	pop    %esi
    1102:	5f                   	pop    %edi
    1103:	5d                   	pop    %ebp
    1104:	c3                   	ret    
    1105:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001110 <stat>:

int
stat(const char *n, struct stat *st)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	56                   	push   %esi
    1114:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1115:	83 ec 08             	sub    $0x8,%esp
    1118:	6a 00                	push   $0x0
    111a:	ff 75 08             	pushl  0x8(%ebp)
    111d:	e8 f1 00 00 00       	call   1213 <open>
  if(fd < 0)
    1122:	83 c4 10             	add    $0x10,%esp
    1125:	85 c0                	test   %eax,%eax
    1127:	78 27                	js     1150 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1129:	83 ec 08             	sub    $0x8,%esp
    112c:	ff 75 0c             	pushl  0xc(%ebp)
    112f:	89 c3                	mov    %eax,%ebx
    1131:	50                   	push   %eax
    1132:	e8 f4 00 00 00       	call   122b <fstat>
  close(fd);
    1137:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    113a:	89 c6                	mov    %eax,%esi
  close(fd);
    113c:	e8 ba 00 00 00       	call   11fb <close>
  return r;
    1141:	83 c4 10             	add    $0x10,%esp
}
    1144:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1147:	89 f0                	mov    %esi,%eax
    1149:	5b                   	pop    %ebx
    114a:	5e                   	pop    %esi
    114b:	5d                   	pop    %ebp
    114c:	c3                   	ret    
    114d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1150:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1155:	eb ed                	jmp    1144 <stat+0x34>
    1157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115e:	66 90                	xchg   %ax,%ax

00001160 <atoi>:

int
atoi(const char *s)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	53                   	push   %ebx
    1164:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1167:	0f be 02             	movsbl (%edx),%eax
    116a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    116d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1170:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1175:	77 1e                	ja     1195 <atoi+0x35>
    1177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1180:	83 c2 01             	add    $0x1,%edx
    1183:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1186:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    118a:	0f be 02             	movsbl (%edx),%eax
    118d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1190:	80 fb 09             	cmp    $0x9,%bl
    1193:	76 eb                	jbe    1180 <atoi+0x20>
  return n;
}
    1195:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1198:	89 c8                	mov    %ecx,%eax
    119a:	c9                   	leave  
    119b:	c3                   	ret    
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	57                   	push   %edi
    11a4:	8b 45 10             	mov    0x10(%ebp),%eax
    11a7:	8b 55 08             	mov    0x8(%ebp),%edx
    11aa:	56                   	push   %esi
    11ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    11ae:	85 c0                	test   %eax,%eax
    11b0:	7e 13                	jle    11c5 <memmove+0x25>
    11b2:	01 d0                	add    %edx,%eax
  dst = vdst;
    11b4:	89 d7                	mov    %edx,%edi
    11b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
    11c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    11c1:	39 f8                	cmp    %edi,%eax
    11c3:	75 fb                	jne    11c0 <memmove+0x20>
  return vdst;
}
    11c5:	5e                   	pop    %esi
    11c6:	89 d0                	mov    %edx,%eax
    11c8:	5f                   	pop    %edi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    

000011cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    11cb:	b8 01 00 00 00       	mov    $0x1,%eax
    11d0:	cd 40                	int    $0x40
    11d2:	c3                   	ret    

000011d3 <exit>:
SYSCALL(exit)
    11d3:	b8 02 00 00 00       	mov    $0x2,%eax
    11d8:	cd 40                	int    $0x40
    11da:	c3                   	ret    

000011db <wait>:
SYSCALL(wait)
    11db:	b8 03 00 00 00       	mov    $0x3,%eax
    11e0:	cd 40                	int    $0x40
    11e2:	c3                   	ret    

000011e3 <pipe>:
SYSCALL(pipe)
    11e3:	b8 04 00 00 00       	mov    $0x4,%eax
    11e8:	cd 40                	int    $0x40
    11ea:	c3                   	ret    

000011eb <read>:
SYSCALL(read)
    11eb:	b8 05 00 00 00       	mov    $0x5,%eax
    11f0:	cd 40                	int    $0x40
    11f2:	c3                   	ret    

000011f3 <write>:
SYSCALL(write)
    11f3:	b8 10 00 00 00       	mov    $0x10,%eax
    11f8:	cd 40                	int    $0x40
    11fa:	c3                   	ret    

000011fb <close>:
SYSCALL(close)
    11fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1200:	cd 40                	int    $0x40
    1202:	c3                   	ret    

00001203 <kill>:
SYSCALL(kill)
    1203:	b8 06 00 00 00       	mov    $0x6,%eax
    1208:	cd 40                	int    $0x40
    120a:	c3                   	ret    

0000120b <exec>:
SYSCALL(exec)
    120b:	b8 07 00 00 00       	mov    $0x7,%eax
    1210:	cd 40                	int    $0x40
    1212:	c3                   	ret    

00001213 <open>:
SYSCALL(open)
    1213:	b8 0f 00 00 00       	mov    $0xf,%eax
    1218:	cd 40                	int    $0x40
    121a:	c3                   	ret    

0000121b <mknod>:
SYSCALL(mknod)
    121b:	b8 11 00 00 00       	mov    $0x11,%eax
    1220:	cd 40                	int    $0x40
    1222:	c3                   	ret    

00001223 <unlink>:
SYSCALL(unlink)
    1223:	b8 12 00 00 00       	mov    $0x12,%eax
    1228:	cd 40                	int    $0x40
    122a:	c3                   	ret    

0000122b <fstat>:
SYSCALL(fstat)
    122b:	b8 08 00 00 00       	mov    $0x8,%eax
    1230:	cd 40                	int    $0x40
    1232:	c3                   	ret    

00001233 <link>:
SYSCALL(link)
    1233:	b8 13 00 00 00       	mov    $0x13,%eax
    1238:	cd 40                	int    $0x40
    123a:	c3                   	ret    

0000123b <mkdir>:
SYSCALL(mkdir)
    123b:	b8 14 00 00 00       	mov    $0x14,%eax
    1240:	cd 40                	int    $0x40
    1242:	c3                   	ret    

00001243 <chdir>:
SYSCALL(chdir)
    1243:	b8 09 00 00 00       	mov    $0x9,%eax
    1248:	cd 40                	int    $0x40
    124a:	c3                   	ret    

0000124b <dup>:
SYSCALL(dup)
    124b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1250:	cd 40                	int    $0x40
    1252:	c3                   	ret    

00001253 <getpid>:
SYSCALL(getpid)
    1253:	b8 0b 00 00 00       	mov    $0xb,%eax
    1258:	cd 40                	int    $0x40
    125a:	c3                   	ret    

0000125b <sbrk>:
SYSCALL(sbrk)
    125b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1260:	cd 40                	int    $0x40
    1262:	c3                   	ret    

00001263 <sleep>:
SYSCALL(sleep)
    1263:	b8 0d 00 00 00       	mov    $0xd,%eax
    1268:	cd 40                	int    $0x40
    126a:	c3                   	ret    

0000126b <uptime>:
SYSCALL(uptime)
    126b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1270:	cd 40                	int    $0x40
    1272:	c3                   	ret    

00001273 <getreadcount>:
    1273:	b8 16 00 00 00       	mov    $0x16,%eax
    1278:	cd 40                	int    $0x40
    127a:	c3                   	ret    
    127b:	66 90                	xchg   %ax,%ax
    127d:	66 90                	xchg   %ax,%ax
    127f:	90                   	nop

00001280 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	56                   	push   %esi
    1285:	53                   	push   %ebx
    1286:	83 ec 3c             	sub    $0x3c,%esp
    1289:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    128c:	89 d1                	mov    %edx,%ecx
{
    128e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1291:	85 d2                	test   %edx,%edx
    1293:	0f 89 7f 00 00 00    	jns    1318 <printint+0x98>
    1299:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    129d:	74 79                	je     1318 <printint+0x98>
    neg = 1;
    129f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    12a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    12a8:	31 db                	xor    %ebx,%ebx
    12aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
    12ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    12b0:	89 c8                	mov    %ecx,%eax
    12b2:	31 d2                	xor    %edx,%edx
    12b4:	89 cf                	mov    %ecx,%edi
    12b6:	f7 75 c4             	divl   -0x3c(%ebp)
    12b9:	0f b6 92 34 1a 00 00 	movzbl 0x1a34(%edx),%edx
    12c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    12c3:	89 d8                	mov    %ebx,%eax
    12c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    12c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    12cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    12ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    12d1:	76 dd                	jbe    12b0 <printint+0x30>
  if(neg)
    12d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    12d6:	85 c9                	test   %ecx,%ecx
    12d8:	74 0c                	je     12e6 <printint+0x66>
    buf[i++] = '-';
    12da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    12df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    12e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    12e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    12e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    12ed:	eb 07                	jmp    12f6 <printint+0x76>
    12ef:	90                   	nop
    putc(fd, buf[i]);
    12f0:	0f b6 13             	movzbl (%ebx),%edx
    12f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    12f6:	83 ec 04             	sub    $0x4,%esp
    12f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    12fc:	6a 01                	push   $0x1
    12fe:	56                   	push   %esi
    12ff:	57                   	push   %edi
    1300:	e8 ee fe ff ff       	call   11f3 <write>
  while(--i >= 0)
    1305:	83 c4 10             	add    $0x10,%esp
    1308:	39 de                	cmp    %ebx,%esi
    130a:	75 e4                	jne    12f0 <printint+0x70>
}
    130c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    130f:	5b                   	pop    %ebx
    1310:	5e                   	pop    %esi
    1311:	5f                   	pop    %edi
    1312:	5d                   	pop    %ebp
    1313:	c3                   	ret    
    1314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1318:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    131f:	eb 87                	jmp    12a8 <printint+0x28>
    1321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1328:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    132f:	90                   	nop

00001330 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	56                   	push   %esi
    1335:	53                   	push   %ebx
    1336:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1339:	8b 75 0c             	mov    0xc(%ebp),%esi
    133c:	0f b6 1e             	movzbl (%esi),%ebx
    133f:	84 db                	test   %bl,%bl
    1341:	0f 84 b8 00 00 00    	je     13ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    1347:	8d 45 10             	lea    0x10(%ebp),%eax
    134a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    134d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1350:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1352:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1355:	eb 37                	jmp    138e <printf+0x5e>
    1357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    135e:	66 90                	xchg   %ax,%ax
    1360:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1363:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1368:	83 f8 25             	cmp    $0x25,%eax
    136b:	74 17                	je     1384 <printf+0x54>
  write(fd, &c, 1);
    136d:	83 ec 04             	sub    $0x4,%esp
    1370:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1373:	6a 01                	push   $0x1
    1375:	57                   	push   %edi
    1376:	ff 75 08             	pushl  0x8(%ebp)
    1379:	e8 75 fe ff ff       	call   11f3 <write>
    137e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1381:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1384:	0f b6 1e             	movzbl (%esi),%ebx
    1387:	83 c6 01             	add    $0x1,%esi
    138a:	84 db                	test   %bl,%bl
    138c:	74 71                	je     13ff <printf+0xcf>
    c = fmt[i] & 0xff;
    138e:	0f be cb             	movsbl %bl,%ecx
    1391:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1394:	85 d2                	test   %edx,%edx
    1396:	74 c8                	je     1360 <printf+0x30>
      }
    } else if(state == '%'){
    1398:	83 fa 25             	cmp    $0x25,%edx
    139b:	75 e7                	jne    1384 <printf+0x54>
      if(c == 'd'){
    139d:	83 f8 64             	cmp    $0x64,%eax
    13a0:	0f 84 9a 00 00 00    	je     1440 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    13a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    13ac:	83 f9 70             	cmp    $0x70,%ecx
    13af:	74 5f                	je     1410 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    13b1:	83 f8 73             	cmp    $0x73,%eax
    13b4:	0f 84 d6 00 00 00    	je     1490 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    13ba:	83 f8 63             	cmp    $0x63,%eax
    13bd:	0f 84 8d 00 00 00    	je     1450 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    13c3:	83 f8 25             	cmp    $0x25,%eax
    13c6:	0f 84 b4 00 00 00    	je     1480 <printf+0x150>
  write(fd, &c, 1);
    13cc:	83 ec 04             	sub    $0x4,%esp
    13cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    13d3:	6a 01                	push   $0x1
    13d5:	57                   	push   %edi
    13d6:	ff 75 08             	pushl  0x8(%ebp)
    13d9:	e8 15 fe ff ff       	call   11f3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    13de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    13e1:	83 c4 0c             	add    $0xc,%esp
    13e4:	6a 01                	push   $0x1
  for(i = 0; fmt[i]; i++){
    13e6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    13e9:	57                   	push   %edi
    13ea:	ff 75 08             	pushl  0x8(%ebp)
    13ed:	e8 01 fe ff ff       	call   11f3 <write>
  for(i = 0; fmt[i]; i++){
    13f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    13f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    13f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    13fb:	84 db                	test   %bl,%bl
    13fd:	75 8f                	jne    138e <printf+0x5e>
    }
  }
}
    13ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1402:	5b                   	pop    %ebx
    1403:	5e                   	pop    %esi
    1404:	5f                   	pop    %edi
    1405:	5d                   	pop    %ebp
    1406:	c3                   	ret    
    1407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    140e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1410:	83 ec 0c             	sub    $0xc,%esp
    1413:	b9 10 00 00 00       	mov    $0x10,%ecx
    1418:	6a 00                	push   $0x0
    141a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    141d:	8b 45 08             	mov    0x8(%ebp),%eax
    1420:	8b 13                	mov    (%ebx),%edx
    1422:	e8 59 fe ff ff       	call   1280 <printint>
        ap++;
    1427:	89 d8                	mov    %ebx,%eax
    1429:	83 c4 10             	add    $0x10,%esp
      state = 0;
    142c:	31 d2                	xor    %edx,%edx
        ap++;
    142e:	83 c0 04             	add    $0x4,%eax
    1431:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1434:	e9 4b ff ff ff       	jmp    1384 <printf+0x54>
    1439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1440:	83 ec 0c             	sub    $0xc,%esp
    1443:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1448:	6a 01                	push   $0x1
    144a:	eb ce                	jmp    141a <printf+0xea>
    144c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1450:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1453:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1456:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1458:	6a 01                	push   $0x1
        ap++;
    145a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    145d:	57                   	push   %edi
    145e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1461:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1464:	e8 8a fd ff ff       	call   11f3 <write>
        ap++;
    1469:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    146c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    146f:	31 d2                	xor    %edx,%edx
    1471:	e9 0e ff ff ff       	jmp    1384 <printf+0x54>
    1476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    147d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1480:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1483:	83 ec 04             	sub    $0x4,%esp
    1486:	e9 59 ff ff ff       	jmp    13e4 <printf+0xb4>
    148b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    148f:	90                   	nop
        s = (char*)*ap;
    1490:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1493:	8b 18                	mov    (%eax),%ebx
        ap++;
    1495:	83 c0 04             	add    $0x4,%eax
    1498:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    149b:	85 db                	test   %ebx,%ebx
    149d:	74 17                	je     14b6 <printf+0x186>
        while(*s != 0){
    149f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    14a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    14a4:	84 c0                	test   %al,%al
    14a6:	0f 84 d8 fe ff ff    	je     1384 <printf+0x54>
    14ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    14af:	89 de                	mov    %ebx,%esi
    14b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14b4:	eb 1a                	jmp    14d0 <printf+0x1a0>
          s = "(null)";
    14b6:	bb 2c 1a 00 00       	mov    $0x1a2c,%ebx
        while(*s != 0){
    14bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    14be:	b8 28 00 00 00       	mov    $0x28,%eax
    14c3:	89 de                	mov    %ebx,%esi
    14c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cf:	90                   	nop
  write(fd, &c, 1);
    14d0:	83 ec 04             	sub    $0x4,%esp
          s++;
    14d3:	83 c6 01             	add    $0x1,%esi
    14d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    14d9:	6a 01                	push   $0x1
    14db:	57                   	push   %edi
    14dc:	53                   	push   %ebx
    14dd:	e8 11 fd ff ff       	call   11f3 <write>
        while(*s != 0){
    14e2:	0f b6 06             	movzbl (%esi),%eax
    14e5:	83 c4 10             	add    $0x10,%esp
    14e8:	84 c0                	test   %al,%al
    14ea:	75 e4                	jne    14d0 <printf+0x1a0>
      state = 0;
    14ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    14ef:	31 d2                	xor    %edx,%edx
    14f1:	e9 8e fe ff ff       	jmp    1384 <printf+0x54>
    14f6:	66 90                	xchg   %ax,%ax
    14f8:	66 90                	xchg   %ax,%ax
    14fa:	66 90                	xchg   %ax,%ax
    14fc:	66 90                	xchg   %ax,%ax
    14fe:	66 90                	xchg   %ax,%ax

00001500 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1500:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1501:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
{
    1506:	89 e5                	mov    %esp,%ebp
    1508:	57                   	push   %edi
    1509:	56                   	push   %esi
    150a:	53                   	push   %ebx
    150b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    150e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1518:	89 c2                	mov    %eax,%edx
    151a:	8b 00                	mov    (%eax),%eax
    151c:	39 ca                	cmp    %ecx,%edx
    151e:	73 30                	jae    1550 <free+0x50>
    1520:	39 c1                	cmp    %eax,%ecx
    1522:	72 04                	jb     1528 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1524:	39 c2                	cmp    %eax,%edx
    1526:	72 f0                	jb     1518 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1528:	8b 73 fc             	mov    -0x4(%ebx),%esi
    152b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    152e:	39 f8                	cmp    %edi,%eax
    1530:	74 30                	je     1562 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1532:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    1535:	8b 42 04             	mov    0x4(%edx),%eax
    1538:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    153b:	39 f1                	cmp    %esi,%ecx
    153d:	74 3a                	je     1579 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    153f:	89 0a                	mov    %ecx,(%edx)
  freep = p;
}
    1541:	5b                   	pop    %ebx
  freep = p;
    1542:	89 15 a0 1f 00 00    	mov    %edx,0x1fa0
}
    1548:	5e                   	pop    %esi
    1549:	5f                   	pop    %edi
    154a:	5d                   	pop    %ebp
    154b:	c3                   	ret    
    154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1550:	39 c2                	cmp    %eax,%edx
    1552:	72 c4                	jb     1518 <free+0x18>
    1554:	39 c1                	cmp    %eax,%ecx
    1556:	73 c0                	jae    1518 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1558:	8b 73 fc             	mov    -0x4(%ebx),%esi
    155b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    155e:	39 f8                	cmp    %edi,%eax
    1560:	75 d0                	jne    1532 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1562:	03 70 04             	add    0x4(%eax),%esi
    1565:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1568:	8b 02                	mov    (%edx),%eax
    156a:	8b 00                	mov    (%eax),%eax
    156c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    156f:	8b 42 04             	mov    0x4(%edx),%eax
    1572:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1575:	39 f1                	cmp    %esi,%ecx
    1577:	75 c6                	jne    153f <free+0x3f>
    p->s.size += bp->s.size;
    1579:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    157c:	89 15 a0 1f 00 00    	mov    %edx,0x1fa0
    p->s.size += bp->s.size;
    1582:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1585:	8b 43 f8             	mov    -0x8(%ebx),%eax
    1588:	89 02                	mov    %eax,(%edx)
}
    158a:	5b                   	pop    %ebx
    158b:	5e                   	pop    %esi
    158c:	5f                   	pop    %edi
    158d:	5d                   	pop    %ebp
    158e:	c3                   	ret    
    158f:	90                   	nop

00001590 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	57                   	push   %edi
    1594:	56                   	push   %esi
    1595:	53                   	push   %ebx
    1596:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1599:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    159c:	8b 3d a0 1f 00 00    	mov    0x1fa0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15a2:	8d 70 07             	lea    0x7(%eax),%esi
    15a5:	c1 ee 03             	shr    $0x3,%esi
    15a8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    15ab:	85 ff                	test   %edi,%edi
    15ad:	0f 84 ad 00 00 00    	je     1660 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15b3:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    15b5:	8b 48 04             	mov    0x4(%eax),%ecx
    15b8:	39 f1                	cmp    %esi,%ecx
    15ba:	73 71                	jae    162d <malloc+0x9d>
    15bc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    15c2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    15c7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    15ca:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    15d1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    15d4:	eb 1b                	jmp    15f1 <malloc+0x61>
    15d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    15e2:	8b 4a 04             	mov    0x4(%edx),%ecx
    15e5:	39 f1                	cmp    %esi,%ecx
    15e7:	73 4f                	jae    1638 <malloc+0xa8>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    15e9:	8b 3d a0 1f 00 00    	mov    0x1fa0,%edi
    15ef:	89 d0                	mov    %edx,%eax
    15f1:	39 c7                	cmp    %eax,%edi
    15f3:	75 eb                	jne    15e0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    15f5:	83 ec 0c             	sub    $0xc,%esp
    15f8:	ff 75 e4             	pushl  -0x1c(%ebp)
    15fb:	e8 5b fc ff ff       	call   125b <sbrk>
  if(p == (char*)-1)
    1600:	83 c4 10             	add    $0x10,%esp
    1603:	83 f8 ff             	cmp    $0xffffffff,%eax
    1606:	74 1b                	je     1623 <malloc+0x93>
  hp->s.size = nu;
    1608:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    160b:	83 ec 0c             	sub    $0xc,%esp
    160e:	83 c0 08             	add    $0x8,%eax
    1611:	50                   	push   %eax
    1612:	e8 e9 fe ff ff       	call   1500 <free>
  return freep;
    1617:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
      if((p = morecore(nunits)) == 0)
    161c:	83 c4 10             	add    $0x10,%esp
    161f:	85 c0                	test   %eax,%eax
    1621:	75 bd                	jne    15e0 <malloc+0x50>
        return 0;
  }
}
    1623:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1626:	31 c0                	xor    %eax,%eax
}
    1628:	5b                   	pop    %ebx
    1629:	5e                   	pop    %esi
    162a:	5f                   	pop    %edi
    162b:	5d                   	pop    %ebp
    162c:	c3                   	ret    
    if(p->s.size >= nunits){
    162d:	89 c2                	mov    %eax,%edx
    162f:	89 f8                	mov    %edi,%eax
    1631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1638:	39 ce                	cmp    %ecx,%esi
    163a:	74 54                	je     1690 <malloc+0x100>
        p->s.size -= nunits;
    163c:	29 f1                	sub    %esi,%ecx
    163e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1641:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1644:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1647:	a3 a0 1f 00 00       	mov    %eax,0x1fa0
}
    164c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    164f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1652:	5b                   	pop    %ebx
    1653:	5e                   	pop    %esi
    1654:	5f                   	pop    %edi
    1655:	5d                   	pop    %ebp
    1656:	c3                   	ret    
    1657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    165e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1660:	c7 05 a0 1f 00 00 a4 	movl   $0x1fa4,0x1fa0
    1667:	1f 00 00 
    base.s.size = 0;
    166a:	bf a4 1f 00 00       	mov    $0x1fa4,%edi
    base.s.ptr = freep = prevp = &base;
    166f:	c7 05 a4 1f 00 00 a4 	movl   $0x1fa4,0x1fa4
    1676:	1f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1679:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    167b:	c7 05 a8 1f 00 00 00 	movl   $0x0,0x1fa8
    1682:	00 00 00 
    if(p->s.size >= nunits){
    1685:	e9 32 ff ff ff       	jmp    15bc <malloc+0x2c>
    168a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1690:	8b 0a                	mov    (%edx),%ecx
    1692:	89 08                	mov    %ecx,(%eax)
    1694:	eb b1                	jmp    1647 <malloc+0xb7>


bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 c9 2b 00 00       	call   102bf5 <memset>

    cons_init();                // init the console
  10002c:	e8 02 16 00 00       	call   101633 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 20 34 10 00 	movl   $0x103420,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 3c 34 10 00 	movl   $0x10343c,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 4a 28 00 00       	call   1028a4 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 29 17 00 00       	call   101788 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 a9 18 00 00       	call   10190d <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 4f 0d 00 00       	call   100db8 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 66 18 00 00       	call   1018d4 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 0c 0d 00 00       	call   100da2 <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 41 34 10 00 	movl   $0x103441,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 4f 34 10 00 	movl   $0x10344f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 5d 34 10 00 	movl   $0x10345d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 6b 34 10 00 	movl   $0x10346b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 79 34 10 00 	movl   $0x103479,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 88 34 10 00 	movl   $0x103488,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 a8 34 10 00 	movl   $0x1034a8,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 27 14 00 00       	call   101664 <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 e2 2c 00 00       	call   102f61 <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 a1 13 00 00       	call   101664 <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 69 13 00 00       	call   101692 <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 c7 34 10 00 	movl   $0x1034c7,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 ca 34 10 00 	movl   $0x1034ca,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 e6 34 10 00 	movl   $0x1034e6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 e8 34 10 00 	movl   $0x1034e8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 7c 14 00 00       	call   1018e0 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 59 08 00 00       	call   100cc9 <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 fa 34 10 00 	movl   $0x1034fa,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 e6 34 10 00 	movl   $0x1034e6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 18 35 10 00    	movl   $0x103518,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 18 35 10 00 	movl   $0x103518,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 2c 3d 10 00 	movl   $0x103d2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 d0 c8 10 00 	movl   $0x10c8d0,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec d1 c8 10 00 	movl   $0x10c8d1,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 a8 e9 10 00 	movl   $0x10e9a8,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 9b 22 00 00       	call   102a69 <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 22 35 10 00 	movl   $0x103522,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 3b 35 10 00 	movl   $0x10353b,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 19 34 10 	movl   $0x103419,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 53 35 10 00 	movl   $0x103553,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 6b 35 10 00 	movl   $0x10356b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 83 35 10 00 	movl   $0x103583,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 9c 35 10 00 	movl   $0x10359c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 c6 35 10 00 	movl   $0x1035c6,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 e2 35 10 00 	movl   $0x1035e2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100aa3:	89 e8                	mov    %ebp,%eax
  100aa5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  100aa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    uint32_t ebp=read_ebp();
  100aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eip=read_eip();
  100aae:	e8 d1 ff ff ff       	call   100a84 <read_eip>
  100ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(int i=0;i<STACKFRAME_DEPTH;i++)
  100ab6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100abd:	e9 85 00 00 00       	jmp    100b47 <print_stackframe+0xae>
    {
        cprintf("ebp:%08x eip:%08x ",ebp,eip);
  100ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ac5:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad0:	c7 04 24 f4 35 10 00 	movl   $0x1035f4,(%esp)
  100ad7:	e8 a8 f7 ff ff       	call   100284 <cprintf>
        for(int j=0;j<4;j++)
  100adc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ae3:	eb 2e                	jmp    100b13 <print_stackframe+0x7a>
            cprintf("arguments%d: %08x ",j,((uint32_t*)ebp)[j+2]);
  100ae5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ae8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af2:	01 d0                	add    %edx,%eax
  100af4:	83 c0 08             	add    $0x8,%eax
  100af7:	8b 00                	mov    (%eax),%eax
  100af9:	89 44 24 08          	mov    %eax,0x8(%esp)
  100afd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100b00:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b04:	c7 04 24 07 36 10 00 	movl   $0x103607,(%esp)
  100b0b:	e8 74 f7 ff ff       	call   100284 <cprintf>
        for(int j=0;j<4;j++)
  100b10:	ff 45 e8             	incl   -0x18(%ebp)
  100b13:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100b17:	7e cc                	jle    100ae5 <print_stackframe+0x4c>
        cprintf("\n");
  100b19:	c7 04 24 1a 36 10 00 	movl   $0x10361a,(%esp)
  100b20:	e8 5f f7 ff ff       	call   100284 <cprintf>
        print_debuginfo(eip-1);
  100b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b28:	48                   	dec    %eax
  100b29:	89 04 24             	mov    %eax,(%esp)
  100b2c:	e8 ac fe ff ff       	call   1009dd <print_debuginfo>
        ebp=((uint32_t*)ebp)[0];
  100b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b34:	8b 00                	mov    (%eax),%eax
  100b36:	89 45 f4             	mov    %eax,-0xc(%ebp)
        eip=((uint32_t*)ebp)[1];
  100b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3c:	83 c0 04             	add    $0x4,%eax
  100b3f:	8b 00                	mov    (%eax),%eax
  100b41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(int i=0;i<STACKFRAME_DEPTH;i++)
  100b44:	ff 45 ec             	incl   -0x14(%ebp)
  100b47:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b4b:	0f 8e 71 ff ff ff    	jle    100ac2 <print_stackframe+0x29>
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
}
  100b51:	90                   	nop
  100b52:	90                   	nop
  100b53:	c9                   	leave  
  100b54:	c3                   	ret    

00100b55 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b55:	f3 0f 1e fb          	endbr32 
  100b59:	55                   	push   %ebp
  100b5a:	89 e5                	mov    %esp,%ebp
  100b5c:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b5f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b66:	eb 0c                	jmp    100b74 <parse+0x1f>
            *buf ++ = '\0';
  100b68:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6b:	8d 50 01             	lea    0x1(%eax),%edx
  100b6e:	89 55 08             	mov    %edx,0x8(%ebp)
  100b71:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b74:	8b 45 08             	mov    0x8(%ebp),%eax
  100b77:	0f b6 00             	movzbl (%eax),%eax
  100b7a:	84 c0                	test   %al,%al
  100b7c:	74 1d                	je     100b9b <parse+0x46>
  100b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b81:	0f b6 00             	movzbl (%eax),%eax
  100b84:	0f be c0             	movsbl %al,%eax
  100b87:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b8b:	c7 04 24 9c 36 10 00 	movl   $0x10369c,(%esp)
  100b92:	e8 9c 1e 00 00       	call   102a33 <strchr>
  100b97:	85 c0                	test   %eax,%eax
  100b99:	75 cd                	jne    100b68 <parse+0x13>
        }
        if (*buf == '\0') {
  100b9b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9e:	0f b6 00             	movzbl (%eax),%eax
  100ba1:	84 c0                	test   %al,%al
  100ba3:	74 65                	je     100c0a <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100ba5:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100ba9:	75 14                	jne    100bbf <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100bab:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bb2:	00 
  100bb3:	c7 04 24 a1 36 10 00 	movl   $0x1036a1,(%esp)
  100bba:	e8 c5 f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bc2:	8d 50 01             	lea    0x1(%eax),%edx
  100bc5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bc8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bcf:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bd2:	01 c2                	add    %eax,%edx
  100bd4:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd7:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bd9:	eb 03                	jmp    100bde <parse+0x89>
            buf ++;
  100bdb:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bde:	8b 45 08             	mov    0x8(%ebp),%eax
  100be1:	0f b6 00             	movzbl (%eax),%eax
  100be4:	84 c0                	test   %al,%al
  100be6:	74 8c                	je     100b74 <parse+0x1f>
  100be8:	8b 45 08             	mov    0x8(%ebp),%eax
  100beb:	0f b6 00             	movzbl (%eax),%eax
  100bee:	0f be c0             	movsbl %al,%eax
  100bf1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bf5:	c7 04 24 9c 36 10 00 	movl   $0x10369c,(%esp)
  100bfc:	e8 32 1e 00 00       	call   102a33 <strchr>
  100c01:	85 c0                	test   %eax,%eax
  100c03:	74 d6                	je     100bdb <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c05:	e9 6a ff ff ff       	jmp    100b74 <parse+0x1f>
            break;
  100c0a:	90                   	nop
        }
    }
    return argc;
  100c0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c0e:	c9                   	leave  
  100c0f:	c3                   	ret    

00100c10 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c10:	f3 0f 1e fb          	endbr32 
  100c14:	55                   	push   %ebp
  100c15:	89 e5                	mov    %esp,%ebp
  100c17:	53                   	push   %ebx
  100c18:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c1b:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c1e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c22:	8b 45 08             	mov    0x8(%ebp),%eax
  100c25:	89 04 24             	mov    %eax,(%esp)
  100c28:	e8 28 ff ff ff       	call   100b55 <parse>
  100c2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c30:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c34:	75 0a                	jne    100c40 <runcmd+0x30>
        return 0;
  100c36:	b8 00 00 00 00       	mov    $0x0,%eax
  100c3b:	e9 83 00 00 00       	jmp    100cc3 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c47:	eb 5a                	jmp    100ca3 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c49:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c4f:	89 d0                	mov    %edx,%eax
  100c51:	01 c0                	add    %eax,%eax
  100c53:	01 d0                	add    %edx,%eax
  100c55:	c1 e0 02             	shl    $0x2,%eax
  100c58:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c5d:	8b 00                	mov    (%eax),%eax
  100c5f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c63:	89 04 24             	mov    %eax,(%esp)
  100c66:	e8 24 1d 00 00       	call   10298f <strcmp>
  100c6b:	85 c0                	test   %eax,%eax
  100c6d:	75 31                	jne    100ca0 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c72:	89 d0                	mov    %edx,%eax
  100c74:	01 c0                	add    %eax,%eax
  100c76:	01 d0                	add    %edx,%eax
  100c78:	c1 e0 02             	shl    $0x2,%eax
  100c7b:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c80:	8b 10                	mov    (%eax),%edx
  100c82:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c85:	83 c0 04             	add    $0x4,%eax
  100c88:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c8b:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c8e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c91:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c95:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c99:	89 1c 24             	mov    %ebx,(%esp)
  100c9c:	ff d2                	call   *%edx
  100c9e:	eb 23                	jmp    100cc3 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100ca0:	ff 45 f4             	incl   -0xc(%ebp)
  100ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ca6:	83 f8 02             	cmp    $0x2,%eax
  100ca9:	76 9e                	jbe    100c49 <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100cab:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cae:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb2:	c7 04 24 bf 36 10 00 	movl   $0x1036bf,(%esp)
  100cb9:	e8 c6 f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cbe:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cc3:	83 c4 64             	add    $0x64,%esp
  100cc6:	5b                   	pop    %ebx
  100cc7:	5d                   	pop    %ebp
  100cc8:	c3                   	ret    

00100cc9 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cc9:	f3 0f 1e fb          	endbr32 
  100ccd:	55                   	push   %ebp
  100cce:	89 e5                	mov    %esp,%ebp
  100cd0:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cd3:	c7 04 24 d8 36 10 00 	movl   $0x1036d8,(%esp)
  100cda:	e8 a5 f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cdf:	c7 04 24 00 37 10 00 	movl   $0x103700,(%esp)
  100ce6:	e8 99 f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100ceb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cef:	74 0b                	je     100cfc <kmonitor+0x33>
        print_trapframe(tf);
  100cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  100cf4:	89 04 24             	mov    %eax,(%esp)
  100cf7:	e8 69 0c 00 00       	call   101965 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cfc:	c7 04 24 25 37 10 00 	movl   $0x103725,(%esp)
  100d03:	e8 2f f6 ff ff       	call   100337 <readline>
  100d08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d0b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d0f:	74 eb                	je     100cfc <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d11:	8b 45 08             	mov    0x8(%ebp),%eax
  100d14:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1b:	89 04 24             	mov    %eax,(%esp)
  100d1e:	e8 ed fe ff ff       	call   100c10 <runcmd>
  100d23:	85 c0                	test   %eax,%eax
  100d25:	78 02                	js     100d29 <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d27:	eb d3                	jmp    100cfc <kmonitor+0x33>
                break;
  100d29:	90                   	nop
            }
        }
    }
}
  100d2a:	90                   	nop
  100d2b:	c9                   	leave  
  100d2c:	c3                   	ret    

00100d2d <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d2d:	f3 0f 1e fb          	endbr32 
  100d31:	55                   	push   %ebp
  100d32:	89 e5                	mov    %esp,%ebp
  100d34:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d3e:	eb 3d                	jmp    100d7d <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d40:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d43:	89 d0                	mov    %edx,%eax
  100d45:	01 c0                	add    %eax,%eax
  100d47:	01 d0                	add    %edx,%eax
  100d49:	c1 e0 02             	shl    $0x2,%eax
  100d4c:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d51:	8b 08                	mov    (%eax),%ecx
  100d53:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d56:	89 d0                	mov    %edx,%eax
  100d58:	01 c0                	add    %eax,%eax
  100d5a:	01 d0                	add    %edx,%eax
  100d5c:	c1 e0 02             	shl    $0x2,%eax
  100d5f:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d64:	8b 00                	mov    (%eax),%eax
  100d66:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d6e:	c7 04 24 29 37 10 00 	movl   $0x103729,(%esp)
  100d75:	e8 0a f5 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d7a:	ff 45 f4             	incl   -0xc(%ebp)
  100d7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d80:	83 f8 02             	cmp    $0x2,%eax
  100d83:	76 bb                	jbe    100d40 <mon_help+0x13>
    }
    return 0;
  100d85:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d8a:	c9                   	leave  
  100d8b:	c3                   	ret    

00100d8c <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d8c:	f3 0f 1e fb          	endbr32 
  100d90:	55                   	push   %ebp
  100d91:	89 e5                	mov    %esp,%ebp
  100d93:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d96:	e8 ac fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100d9b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100da0:	c9                   	leave  
  100da1:	c3                   	ret    

00100da2 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100da2:	f3 0f 1e fb          	endbr32 
  100da6:	55                   	push   %ebp
  100da7:	89 e5                	mov    %esp,%ebp
  100da9:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100dac:	e8 e8 fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100db1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100db6:	c9                   	leave  
  100db7:	c3                   	ret    

00100db8 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100db8:	f3 0f 1e fb          	endbr32 
  100dbc:	55                   	push   %ebp
  100dbd:	89 e5                	mov    %esp,%ebp
  100dbf:	83 ec 28             	sub    $0x28,%esp
  100dc2:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dc8:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dcc:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dd0:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dd4:	ee                   	out    %al,(%dx)
}
  100dd5:	90                   	nop
  100dd6:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100ddc:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de0:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100de4:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100de8:	ee                   	out    %al,(%dx)
}
  100de9:	90                   	nop
  100dea:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100df0:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df4:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100df8:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dfc:	ee                   	out    %al,(%dx)
}
  100dfd:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dfe:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e05:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e08:	c7 04 24 32 37 10 00 	movl   $0x103732,(%esp)
  100e0f:	e8 70 f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e14:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e1b:	e8 31 09 00 00       	call   101751 <pic_enable>
}
  100e20:	90                   	nop
  100e21:	c9                   	leave  
  100e22:	c3                   	ret    

00100e23 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e23:	f3 0f 1e fb          	endbr32 
  100e27:	55                   	push   %ebp
  100e28:	89 e5                	mov    %esp,%ebp
  100e2a:	83 ec 10             	sub    $0x10,%esp
  100e2d:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e33:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e37:	89 c2                	mov    %eax,%edx
  100e39:	ec                   	in     (%dx),%al
  100e3a:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e3d:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e43:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e47:	89 c2                	mov    %eax,%edx
  100e49:	ec                   	in     (%dx),%al
  100e4a:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e4d:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e53:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e57:	89 c2                	mov    %eax,%edx
  100e59:	ec                   	in     (%dx),%al
  100e5a:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e5d:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e63:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e67:	89 c2                	mov    %eax,%edx
  100e69:	ec                   	in     (%dx),%al
  100e6a:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e6d:	90                   	nop
  100e6e:	c9                   	leave  
  100e6f:	c3                   	ret    

00100e70 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e70:	f3 0f 1e fb          	endbr32 
  100e74:	55                   	push   %ebp
  100e75:	89 e5                	mov    %esp,%ebp
  100e77:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e7a:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e81:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e84:	0f b7 00             	movzwl (%eax),%eax
  100e87:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e8e:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e93:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e96:	0f b7 00             	movzwl (%eax),%eax
  100e99:	0f b7 c0             	movzwl %ax,%eax
  100e9c:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100ea1:	74 12                	je     100eb5 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100ea3:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100eaa:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100eb1:	b4 03 
  100eb3:	eb 13                	jmp    100ec8 <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100eb5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eb8:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ebc:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ebf:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100ec6:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100ec8:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ecf:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ed3:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ed7:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100edb:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100edf:	ee                   	out    %al,(%dx)
}
  100ee0:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ee1:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ee8:	40                   	inc    %eax
  100ee9:	0f b7 c0             	movzwl %ax,%eax
  100eec:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ef0:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ef4:	89 c2                	mov    %eax,%edx
  100ef6:	ec                   	in     (%dx),%al
  100ef7:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100efa:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100efe:	0f b6 c0             	movzbl %al,%eax
  100f01:	c1 e0 08             	shl    $0x8,%eax
  100f04:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f07:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f0e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f12:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f16:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f1a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f1e:	ee                   	out    %al,(%dx)
}
  100f1f:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f20:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f27:	40                   	inc    %eax
  100f28:	0f b7 c0             	movzwl %ax,%eax
  100f2b:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f2f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f33:	89 c2                	mov    %eax,%edx
  100f35:	ec                   	in     (%dx),%al
  100f36:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f39:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f3d:	0f b6 c0             	movzbl %al,%eax
  100f40:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f43:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f46:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f4e:	0f b7 c0             	movzwl %ax,%eax
  100f51:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f57:	90                   	nop
  100f58:	c9                   	leave  
  100f59:	c3                   	ret    

00100f5a <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f5a:	f3 0f 1e fb          	endbr32 
  100f5e:	55                   	push   %ebp
  100f5f:	89 e5                	mov    %esp,%ebp
  100f61:	83 ec 48             	sub    $0x48,%esp
  100f64:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f6a:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f6e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f72:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f76:	ee                   	out    %al,(%dx)
}
  100f77:	90                   	nop
  100f78:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f7e:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f82:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f86:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f8a:	ee                   	out    %al,(%dx)
}
  100f8b:	90                   	nop
  100f8c:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f92:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f96:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f9a:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f9e:	ee                   	out    %al,(%dx)
}
  100f9f:	90                   	nop
  100fa0:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fa6:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100faa:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fae:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fb2:	ee                   	out    %al,(%dx)
}
  100fb3:	90                   	nop
  100fb4:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fba:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fbe:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fc2:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fc6:	ee                   	out    %al,(%dx)
}
  100fc7:	90                   	nop
  100fc8:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fce:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fd6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fda:	ee                   	out    %al,(%dx)
}
  100fdb:	90                   	nop
  100fdc:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fe2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fe6:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fea:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100fee:	ee                   	out    %al,(%dx)
}
  100fef:	90                   	nop
  100ff0:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ff6:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ffa:	89 c2                	mov    %eax,%edx
  100ffc:	ec                   	in     (%dx),%al
  100ffd:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101000:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101004:	3c ff                	cmp    $0xff,%al
  101006:	0f 95 c0             	setne  %al
  101009:	0f b6 c0             	movzbl %al,%eax
  10100c:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  101011:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101017:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10101b:	89 c2                	mov    %eax,%edx
  10101d:	ec                   	in     (%dx),%al
  10101e:	88 45 f1             	mov    %al,-0xf(%ebp)
  101021:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101027:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10102b:	89 c2                	mov    %eax,%edx
  10102d:	ec                   	in     (%dx),%al
  10102e:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101031:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101036:	85 c0                	test   %eax,%eax
  101038:	74 0c                	je     101046 <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10103a:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101041:	e8 0b 07 00 00       	call   101751 <pic_enable>
    }
}
  101046:	90                   	nop
  101047:	c9                   	leave  
  101048:	c3                   	ret    

00101049 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101049:	f3 0f 1e fb          	endbr32 
  10104d:	55                   	push   %ebp
  10104e:	89 e5                	mov    %esp,%ebp
  101050:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101053:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10105a:	eb 08                	jmp    101064 <lpt_putc_sub+0x1b>
        delay();
  10105c:	e8 c2 fd ff ff       	call   100e23 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101061:	ff 45 fc             	incl   -0x4(%ebp)
  101064:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10106a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10106e:	89 c2                	mov    %eax,%edx
  101070:	ec                   	in     (%dx),%al
  101071:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101074:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101078:	84 c0                	test   %al,%al
  10107a:	78 09                	js     101085 <lpt_putc_sub+0x3c>
  10107c:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101083:	7e d7                	jle    10105c <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101085:	8b 45 08             	mov    0x8(%ebp),%eax
  101088:	0f b6 c0             	movzbl %al,%eax
  10108b:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101091:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101094:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101098:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10109c:	ee                   	out    %al,(%dx)
}
  10109d:	90                   	nop
  10109e:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010a4:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010a8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010ac:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010b0:	ee                   	out    %al,(%dx)
}
  1010b1:	90                   	nop
  1010b2:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010b8:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010bc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010c0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010c4:	ee                   	out    %al,(%dx)
}
  1010c5:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010c6:	90                   	nop
  1010c7:	c9                   	leave  
  1010c8:	c3                   	ret    

001010c9 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010c9:	f3 0f 1e fb          	endbr32 
  1010cd:	55                   	push   %ebp
  1010ce:	89 e5                	mov    %esp,%ebp
  1010d0:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010d3:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010d7:	74 0d                	je     1010e6 <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1010dc:	89 04 24             	mov    %eax,(%esp)
  1010df:	e8 65 ff ff ff       	call   101049 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010e4:	eb 24                	jmp    10110a <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010e6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010ed:	e8 57 ff ff ff       	call   101049 <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010f2:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010f9:	e8 4b ff ff ff       	call   101049 <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010fe:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101105:	e8 3f ff ff ff       	call   101049 <lpt_putc_sub>
}
  10110a:	90                   	nop
  10110b:	c9                   	leave  
  10110c:	c3                   	ret    

0010110d <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10110d:	f3 0f 1e fb          	endbr32 
  101111:	55                   	push   %ebp
  101112:	89 e5                	mov    %esp,%ebp
  101114:	53                   	push   %ebx
  101115:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101118:	8b 45 08             	mov    0x8(%ebp),%eax
  10111b:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101120:	85 c0                	test   %eax,%eax
  101122:	75 07                	jne    10112b <cga_putc+0x1e>
        c |= 0x0700;
  101124:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10112b:	8b 45 08             	mov    0x8(%ebp),%eax
  10112e:	0f b6 c0             	movzbl %al,%eax
  101131:	83 f8 0d             	cmp    $0xd,%eax
  101134:	74 72                	je     1011a8 <cga_putc+0x9b>
  101136:	83 f8 0d             	cmp    $0xd,%eax
  101139:	0f 8f a3 00 00 00    	jg     1011e2 <cga_putc+0xd5>
  10113f:	83 f8 08             	cmp    $0x8,%eax
  101142:	74 0a                	je     10114e <cga_putc+0x41>
  101144:	83 f8 0a             	cmp    $0xa,%eax
  101147:	74 4c                	je     101195 <cga_putc+0x88>
  101149:	e9 94 00 00 00       	jmp    1011e2 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  10114e:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101155:	85 c0                	test   %eax,%eax
  101157:	0f 84 af 00 00 00    	je     10120c <cga_putc+0xff>
            crt_pos --;
  10115d:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101164:	48                   	dec    %eax
  101165:	0f b7 c0             	movzwl %ax,%eax
  101168:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10116e:	8b 45 08             	mov    0x8(%ebp),%eax
  101171:	98                   	cwtl   
  101172:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101177:	98                   	cwtl   
  101178:	83 c8 20             	or     $0x20,%eax
  10117b:	98                   	cwtl   
  10117c:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101182:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101189:	01 c9                	add    %ecx,%ecx
  10118b:	01 ca                	add    %ecx,%edx
  10118d:	0f b7 c0             	movzwl %ax,%eax
  101190:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101193:	eb 77                	jmp    10120c <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  101195:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10119c:	83 c0 50             	add    $0x50,%eax
  10119f:	0f b7 c0             	movzwl %ax,%eax
  1011a2:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011a8:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011af:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011b6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011bb:	89 c8                	mov    %ecx,%eax
  1011bd:	f7 e2                	mul    %edx
  1011bf:	c1 ea 06             	shr    $0x6,%edx
  1011c2:	89 d0                	mov    %edx,%eax
  1011c4:	c1 e0 02             	shl    $0x2,%eax
  1011c7:	01 d0                	add    %edx,%eax
  1011c9:	c1 e0 04             	shl    $0x4,%eax
  1011cc:	29 c1                	sub    %eax,%ecx
  1011ce:	89 c8                	mov    %ecx,%eax
  1011d0:	0f b7 c0             	movzwl %ax,%eax
  1011d3:	29 c3                	sub    %eax,%ebx
  1011d5:	89 d8                	mov    %ebx,%eax
  1011d7:	0f b7 c0             	movzwl %ax,%eax
  1011da:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011e0:	eb 2b                	jmp    10120d <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011e2:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011e8:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011ef:	8d 50 01             	lea    0x1(%eax),%edx
  1011f2:	0f b7 d2             	movzwl %dx,%edx
  1011f5:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011fc:	01 c0                	add    %eax,%eax
  1011fe:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101201:	8b 45 08             	mov    0x8(%ebp),%eax
  101204:	0f b7 c0             	movzwl %ax,%eax
  101207:	66 89 02             	mov    %ax,(%edx)
        break;
  10120a:	eb 01                	jmp    10120d <cga_putc+0x100>
        break;
  10120c:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10120d:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101214:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101219:	76 5d                	jbe    101278 <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10121b:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101220:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101226:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10122b:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101232:	00 
  101233:	89 54 24 04          	mov    %edx,0x4(%esp)
  101237:	89 04 24             	mov    %eax,(%esp)
  10123a:	e8 f9 19 00 00       	call   102c38 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10123f:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101246:	eb 14                	jmp    10125c <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  101248:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10124d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101250:	01 d2                	add    %edx,%edx
  101252:	01 d0                	add    %edx,%eax
  101254:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101259:	ff 45 f4             	incl   -0xc(%ebp)
  10125c:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101263:	7e e3                	jle    101248 <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101265:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10126c:	83 e8 50             	sub    $0x50,%eax
  10126f:	0f b7 c0             	movzwl %ax,%eax
  101272:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101278:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  10127f:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101283:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101287:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10128b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10128f:	ee                   	out    %al,(%dx)
}
  101290:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101291:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101298:	c1 e8 08             	shr    $0x8,%eax
  10129b:	0f b7 c0             	movzwl %ax,%eax
  10129e:	0f b6 c0             	movzbl %al,%eax
  1012a1:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012a8:	42                   	inc    %edx
  1012a9:	0f b7 d2             	movzwl %dx,%edx
  1012ac:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012b0:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b3:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012b7:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012bb:	ee                   	out    %al,(%dx)
}
  1012bc:	90                   	nop
    outb(addr_6845, 15);
  1012bd:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012c4:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012c8:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012cc:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012d0:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012d4:	ee                   	out    %al,(%dx)
}
  1012d5:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012d6:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012dd:	0f b6 c0             	movzbl %al,%eax
  1012e0:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012e7:	42                   	inc    %edx
  1012e8:	0f b7 d2             	movzwl %dx,%edx
  1012eb:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012ef:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012f2:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012f6:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012fa:	ee                   	out    %al,(%dx)
}
  1012fb:	90                   	nop
}
  1012fc:	90                   	nop
  1012fd:	83 c4 34             	add    $0x34,%esp
  101300:	5b                   	pop    %ebx
  101301:	5d                   	pop    %ebp
  101302:	c3                   	ret    

00101303 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101303:	f3 0f 1e fb          	endbr32 
  101307:	55                   	push   %ebp
  101308:	89 e5                	mov    %esp,%ebp
  10130a:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10130d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101314:	eb 08                	jmp    10131e <serial_putc_sub+0x1b>
        delay();
  101316:	e8 08 fb ff ff       	call   100e23 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10131b:	ff 45 fc             	incl   -0x4(%ebp)
  10131e:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101324:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101328:	89 c2                	mov    %eax,%edx
  10132a:	ec                   	in     (%dx),%al
  10132b:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10132e:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101332:	0f b6 c0             	movzbl %al,%eax
  101335:	83 e0 20             	and    $0x20,%eax
  101338:	85 c0                	test   %eax,%eax
  10133a:	75 09                	jne    101345 <serial_putc_sub+0x42>
  10133c:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101343:	7e d1                	jle    101316 <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101345:	8b 45 08             	mov    0x8(%ebp),%eax
  101348:	0f b6 c0             	movzbl %al,%eax
  10134b:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101351:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101354:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101358:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10135c:	ee                   	out    %al,(%dx)
}
  10135d:	90                   	nop
}
  10135e:	90                   	nop
  10135f:	c9                   	leave  
  101360:	c3                   	ret    

00101361 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101361:	f3 0f 1e fb          	endbr32 
  101365:	55                   	push   %ebp
  101366:	89 e5                	mov    %esp,%ebp
  101368:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10136b:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10136f:	74 0d                	je     10137e <serial_putc+0x1d>
        serial_putc_sub(c);
  101371:	8b 45 08             	mov    0x8(%ebp),%eax
  101374:	89 04 24             	mov    %eax,(%esp)
  101377:	e8 87 ff ff ff       	call   101303 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10137c:	eb 24                	jmp    1013a2 <serial_putc+0x41>
        serial_putc_sub('\b');
  10137e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101385:	e8 79 ff ff ff       	call   101303 <serial_putc_sub>
        serial_putc_sub(' ');
  10138a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101391:	e8 6d ff ff ff       	call   101303 <serial_putc_sub>
        serial_putc_sub('\b');
  101396:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10139d:	e8 61 ff ff ff       	call   101303 <serial_putc_sub>
}
  1013a2:	90                   	nop
  1013a3:	c9                   	leave  
  1013a4:	c3                   	ret    

001013a5 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013a5:	f3 0f 1e fb          	endbr32 
  1013a9:	55                   	push   %ebp
  1013aa:	89 e5                	mov    %esp,%ebp
  1013ac:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013af:	eb 33                	jmp    1013e4 <cons_intr+0x3f>
        if (c != 0) {
  1013b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013b5:	74 2d                	je     1013e4 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013b7:	a1 84 00 11 00       	mov    0x110084,%eax
  1013bc:	8d 50 01             	lea    0x1(%eax),%edx
  1013bf:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013c8:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013ce:	a1 84 00 11 00       	mov    0x110084,%eax
  1013d3:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013d8:	75 0a                	jne    1013e4 <cons_intr+0x3f>
                cons.wpos = 0;
  1013da:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013e1:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1013e7:	ff d0                	call   *%eax
  1013e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013ec:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013f0:	75 bf                	jne    1013b1 <cons_intr+0xc>
            }
        }
    }
}
  1013f2:	90                   	nop
  1013f3:	90                   	nop
  1013f4:	c9                   	leave  
  1013f5:	c3                   	ret    

001013f6 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013f6:	f3 0f 1e fb          	endbr32 
  1013fa:	55                   	push   %ebp
  1013fb:	89 e5                	mov    %esp,%ebp
  1013fd:	83 ec 10             	sub    $0x10,%esp
  101400:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101406:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10140a:	89 c2                	mov    %eax,%edx
  10140c:	ec                   	in     (%dx),%al
  10140d:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101410:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101414:	0f b6 c0             	movzbl %al,%eax
  101417:	83 e0 01             	and    $0x1,%eax
  10141a:	85 c0                	test   %eax,%eax
  10141c:	75 07                	jne    101425 <serial_proc_data+0x2f>
        return -1;
  10141e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101423:	eb 2a                	jmp    10144f <serial_proc_data+0x59>
  101425:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10142b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10142f:	89 c2                	mov    %eax,%edx
  101431:	ec                   	in     (%dx),%al
  101432:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101435:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101439:	0f b6 c0             	movzbl %al,%eax
  10143c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10143f:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101443:	75 07                	jne    10144c <serial_proc_data+0x56>
        c = '\b';
  101445:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10144c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10144f:	c9                   	leave  
  101450:	c3                   	ret    

00101451 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101451:	f3 0f 1e fb          	endbr32 
  101455:	55                   	push   %ebp
  101456:	89 e5                	mov    %esp,%ebp
  101458:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10145b:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101460:	85 c0                	test   %eax,%eax
  101462:	74 0c                	je     101470 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101464:	c7 04 24 f6 13 10 00 	movl   $0x1013f6,(%esp)
  10146b:	e8 35 ff ff ff       	call   1013a5 <cons_intr>
    }
}
  101470:	90                   	nop
  101471:	c9                   	leave  
  101472:	c3                   	ret    

00101473 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101473:	f3 0f 1e fb          	endbr32 
  101477:	55                   	push   %ebp
  101478:	89 e5                	mov    %esp,%ebp
  10147a:	83 ec 38             	sub    $0x38,%esp
  10147d:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101483:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101486:	89 c2                	mov    %eax,%edx
  101488:	ec                   	in     (%dx),%al
  101489:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10148c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101490:	0f b6 c0             	movzbl %al,%eax
  101493:	83 e0 01             	and    $0x1,%eax
  101496:	85 c0                	test   %eax,%eax
  101498:	75 0a                	jne    1014a4 <kbd_proc_data+0x31>
        return -1;
  10149a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10149f:	e9 56 01 00 00       	jmp    1015fa <kbd_proc_data+0x187>
  1014a4:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014ad:	89 c2                	mov    %eax,%edx
  1014af:	ec                   	in     (%dx),%al
  1014b0:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014b3:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014b7:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014ba:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014be:	75 17                	jne    1014d7 <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014c0:	a1 88 00 11 00       	mov    0x110088,%eax
  1014c5:	83 c8 40             	or     $0x40,%eax
  1014c8:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014cd:	b8 00 00 00 00       	mov    $0x0,%eax
  1014d2:	e9 23 01 00 00       	jmp    1015fa <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014d7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014db:	84 c0                	test   %al,%al
  1014dd:	79 45                	jns    101524 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014df:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e4:	83 e0 40             	and    $0x40,%eax
  1014e7:	85 c0                	test   %eax,%eax
  1014e9:	75 08                	jne    1014f3 <kbd_proc_data+0x80>
  1014eb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ef:	24 7f                	and    $0x7f,%al
  1014f1:	eb 04                	jmp    1014f7 <kbd_proc_data+0x84>
  1014f3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f7:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014fa:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014fe:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101505:	0c 40                	or     $0x40,%al
  101507:	0f b6 c0             	movzbl %al,%eax
  10150a:	f7 d0                	not    %eax
  10150c:	89 c2                	mov    %eax,%edx
  10150e:	a1 88 00 11 00       	mov    0x110088,%eax
  101513:	21 d0                	and    %edx,%eax
  101515:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10151a:	b8 00 00 00 00       	mov    $0x0,%eax
  10151f:	e9 d6 00 00 00       	jmp    1015fa <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101524:	a1 88 00 11 00       	mov    0x110088,%eax
  101529:	83 e0 40             	and    $0x40,%eax
  10152c:	85 c0                	test   %eax,%eax
  10152e:	74 11                	je     101541 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101530:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101534:	a1 88 00 11 00       	mov    0x110088,%eax
  101539:	83 e0 bf             	and    $0xffffffbf,%eax
  10153c:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101541:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101545:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10154c:	0f b6 d0             	movzbl %al,%edx
  10154f:	a1 88 00 11 00       	mov    0x110088,%eax
  101554:	09 d0                	or     %edx,%eax
  101556:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10155b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10155f:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101566:	0f b6 d0             	movzbl %al,%edx
  101569:	a1 88 00 11 00       	mov    0x110088,%eax
  10156e:	31 d0                	xor    %edx,%eax
  101570:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101575:	a1 88 00 11 00       	mov    0x110088,%eax
  10157a:	83 e0 03             	and    $0x3,%eax
  10157d:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101584:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101588:	01 d0                	add    %edx,%eax
  10158a:	0f b6 00             	movzbl (%eax),%eax
  10158d:	0f b6 c0             	movzbl %al,%eax
  101590:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101593:	a1 88 00 11 00       	mov    0x110088,%eax
  101598:	83 e0 08             	and    $0x8,%eax
  10159b:	85 c0                	test   %eax,%eax
  10159d:	74 22                	je     1015c1 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  10159f:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015a3:	7e 0c                	jle    1015b1 <kbd_proc_data+0x13e>
  1015a5:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015a9:	7f 06                	jg     1015b1 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015ab:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015af:	eb 10                	jmp    1015c1 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015b1:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015b5:	7e 0a                	jle    1015c1 <kbd_proc_data+0x14e>
  1015b7:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015bb:	7f 04                	jg     1015c1 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015bd:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015c1:	a1 88 00 11 00       	mov    0x110088,%eax
  1015c6:	f7 d0                	not    %eax
  1015c8:	83 e0 06             	and    $0x6,%eax
  1015cb:	85 c0                	test   %eax,%eax
  1015cd:	75 28                	jne    1015f7 <kbd_proc_data+0x184>
  1015cf:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015d6:	75 1f                	jne    1015f7 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015d8:	c7 04 24 4d 37 10 00 	movl   $0x10374d,(%esp)
  1015df:	e8 a0 ec ff ff       	call   100284 <cprintf>
  1015e4:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015ea:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015ee:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015f2:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015f5:	ee                   	out    %al,(%dx)
}
  1015f6:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015fa:	c9                   	leave  
  1015fb:	c3                   	ret    

001015fc <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015fc:	f3 0f 1e fb          	endbr32 
  101600:	55                   	push   %ebp
  101601:	89 e5                	mov    %esp,%ebp
  101603:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101606:	c7 04 24 73 14 10 00 	movl   $0x101473,(%esp)
  10160d:	e8 93 fd ff ff       	call   1013a5 <cons_intr>
}
  101612:	90                   	nop
  101613:	c9                   	leave  
  101614:	c3                   	ret    

00101615 <kbd_init>:

static void
kbd_init(void) {
  101615:	f3 0f 1e fb          	endbr32 
  101619:	55                   	push   %ebp
  10161a:	89 e5                	mov    %esp,%ebp
  10161c:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10161f:	e8 d8 ff ff ff       	call   1015fc <kbd_intr>
    pic_enable(IRQ_KBD);
  101624:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10162b:	e8 21 01 00 00       	call   101751 <pic_enable>
}
  101630:	90                   	nop
  101631:	c9                   	leave  
  101632:	c3                   	ret    

00101633 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101633:	f3 0f 1e fb          	endbr32 
  101637:	55                   	push   %ebp
  101638:	89 e5                	mov    %esp,%ebp
  10163a:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10163d:	e8 2e f8 ff ff       	call   100e70 <cga_init>
    serial_init();
  101642:	e8 13 f9 ff ff       	call   100f5a <serial_init>
    kbd_init();
  101647:	e8 c9 ff ff ff       	call   101615 <kbd_init>
    if (!serial_exists) {
  10164c:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101651:	85 c0                	test   %eax,%eax
  101653:	75 0c                	jne    101661 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101655:	c7 04 24 59 37 10 00 	movl   $0x103759,(%esp)
  10165c:	e8 23 ec ff ff       	call   100284 <cprintf>
    }
}
  101661:	90                   	nop
  101662:	c9                   	leave  
  101663:	c3                   	ret    

00101664 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101664:	f3 0f 1e fb          	endbr32 
  101668:	55                   	push   %ebp
  101669:	89 e5                	mov    %esp,%ebp
  10166b:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10166e:	8b 45 08             	mov    0x8(%ebp),%eax
  101671:	89 04 24             	mov    %eax,(%esp)
  101674:	e8 50 fa ff ff       	call   1010c9 <lpt_putc>
    cga_putc(c);
  101679:	8b 45 08             	mov    0x8(%ebp),%eax
  10167c:	89 04 24             	mov    %eax,(%esp)
  10167f:	e8 89 fa ff ff       	call   10110d <cga_putc>
    serial_putc(c);
  101684:	8b 45 08             	mov    0x8(%ebp),%eax
  101687:	89 04 24             	mov    %eax,(%esp)
  10168a:	e8 d2 fc ff ff       	call   101361 <serial_putc>
}
  10168f:	90                   	nop
  101690:	c9                   	leave  
  101691:	c3                   	ret    

00101692 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101692:	f3 0f 1e fb          	endbr32 
  101696:	55                   	push   %ebp
  101697:	89 e5                	mov    %esp,%ebp
  101699:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10169c:	e8 b0 fd ff ff       	call   101451 <serial_intr>
    kbd_intr();
  1016a1:	e8 56 ff ff ff       	call   1015fc <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016a6:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016ac:	a1 84 00 11 00       	mov    0x110084,%eax
  1016b1:	39 c2                	cmp    %eax,%edx
  1016b3:	74 36                	je     1016eb <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016b5:	a1 80 00 11 00       	mov    0x110080,%eax
  1016ba:	8d 50 01             	lea    0x1(%eax),%edx
  1016bd:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016c3:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016ca:	0f b6 c0             	movzbl %al,%eax
  1016cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016d0:	a1 80 00 11 00       	mov    0x110080,%eax
  1016d5:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016da:	75 0a                	jne    1016e6 <cons_getc+0x54>
            cons.rpos = 0;
  1016dc:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016e3:	00 00 00 
        }
        return c;
  1016e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016e9:	eb 05                	jmp    1016f0 <cons_getc+0x5e>
    }
    return 0;
  1016eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016f0:	c9                   	leave  
  1016f1:	c3                   	ret    

001016f2 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016f2:	f3 0f 1e fb          	endbr32 
  1016f6:	55                   	push   %ebp
  1016f7:	89 e5                	mov    %esp,%ebp
  1016f9:	83 ec 14             	sub    $0x14,%esp
  1016fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1016ff:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101703:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101706:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  10170c:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101711:	85 c0                	test   %eax,%eax
  101713:	74 39                	je     10174e <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101715:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101718:	0f b6 c0             	movzbl %al,%eax
  10171b:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101721:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101724:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101728:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10172c:	ee                   	out    %al,(%dx)
}
  10172d:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  10172e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101732:	c1 e8 08             	shr    $0x8,%eax
  101735:	0f b7 c0             	movzwl %ax,%eax
  101738:	0f b6 c0             	movzbl %al,%eax
  10173b:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101741:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101744:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101748:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10174c:	ee                   	out    %al,(%dx)
}
  10174d:	90                   	nop
    }
}
  10174e:	90                   	nop
  10174f:	c9                   	leave  
  101750:	c3                   	ret    

00101751 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101751:	f3 0f 1e fb          	endbr32 
  101755:	55                   	push   %ebp
  101756:	89 e5                	mov    %esp,%ebp
  101758:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10175b:	8b 45 08             	mov    0x8(%ebp),%eax
  10175e:	ba 01 00 00 00       	mov    $0x1,%edx
  101763:	88 c1                	mov    %al,%cl
  101765:	d3 e2                	shl    %cl,%edx
  101767:	89 d0                	mov    %edx,%eax
  101769:	98                   	cwtl   
  10176a:	f7 d0                	not    %eax
  10176c:	0f bf d0             	movswl %ax,%edx
  10176f:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101776:	98                   	cwtl   
  101777:	21 d0                	and    %edx,%eax
  101779:	98                   	cwtl   
  10177a:	0f b7 c0             	movzwl %ax,%eax
  10177d:	89 04 24             	mov    %eax,(%esp)
  101780:	e8 6d ff ff ff       	call   1016f2 <pic_setmask>
}
  101785:	90                   	nop
  101786:	c9                   	leave  
  101787:	c3                   	ret    

00101788 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101788:	f3 0f 1e fb          	endbr32 
  10178c:	55                   	push   %ebp
  10178d:	89 e5                	mov    %esp,%ebp
  10178f:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101792:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  101799:	00 00 00 
  10179c:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017a2:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017a6:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017aa:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017ae:	ee                   	out    %al,(%dx)
}
  1017af:	90                   	nop
  1017b0:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017b6:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ba:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017be:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017c2:	ee                   	out    %al,(%dx)
}
  1017c3:	90                   	nop
  1017c4:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017ca:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ce:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017d2:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017d6:	ee                   	out    %al,(%dx)
}
  1017d7:	90                   	nop
  1017d8:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017de:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e2:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017e6:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017ea:	ee                   	out    %al,(%dx)
}
  1017eb:	90                   	nop
  1017ec:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017f2:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f6:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017fa:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1017fe:	ee                   	out    %al,(%dx)
}
  1017ff:	90                   	nop
  101800:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101806:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10180e:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101812:	ee                   	out    %al,(%dx)
}
  101813:	90                   	nop
  101814:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10181a:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10181e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101822:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101826:	ee                   	out    %al,(%dx)
}
  101827:	90                   	nop
  101828:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  10182e:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101832:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101836:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10183a:	ee                   	out    %al,(%dx)
}
  10183b:	90                   	nop
  10183c:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101842:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101846:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10184a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10184e:	ee                   	out    %al,(%dx)
}
  10184f:	90                   	nop
  101850:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101856:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10185a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10185e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101862:	ee                   	out    %al,(%dx)
}
  101863:	90                   	nop
  101864:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10186a:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10186e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101872:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101876:	ee                   	out    %al,(%dx)
}
  101877:	90                   	nop
  101878:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10187e:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101882:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101886:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10188a:	ee                   	out    %al,(%dx)
}
  10188b:	90                   	nop
  10188c:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101892:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101896:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10189a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10189e:	ee                   	out    %al,(%dx)
}
  10189f:	90                   	nop
  1018a0:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018a6:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018aa:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018ae:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018b2:	ee                   	out    %al,(%dx)
}
  1018b3:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018b4:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018bb:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018c0:	74 0f                	je     1018d1 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018c2:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018c9:	89 04 24             	mov    %eax,(%esp)
  1018cc:	e8 21 fe ff ff       	call   1016f2 <pic_setmask>
    }
}
  1018d1:	90                   	nop
  1018d2:	c9                   	leave  
  1018d3:	c3                   	ret    

001018d4 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018d4:	f3 0f 1e fb          	endbr32 
  1018d8:	55                   	push   %ebp
  1018d9:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018db:	fb                   	sti    
}
  1018dc:	90                   	nop
    sti();
}
  1018dd:	90                   	nop
  1018de:	5d                   	pop    %ebp
  1018df:	c3                   	ret    

001018e0 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018e0:	f3 0f 1e fb          	endbr32 
  1018e4:	55                   	push   %ebp
  1018e5:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018e7:	fa                   	cli    
}
  1018e8:	90                   	nop
    cli();
}
  1018e9:	90                   	nop
  1018ea:	5d                   	pop    %ebp
  1018eb:	c3                   	ret    

001018ec <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018ec:	f3 0f 1e fb          	endbr32 
  1018f0:	55                   	push   %ebp
  1018f1:	89 e5                	mov    %esp,%ebp
  1018f3:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018f6:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1018fd:	00 
  1018fe:	c7 04 24 80 37 10 00 	movl   $0x103780,(%esp)
  101905:	e8 7a e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10190a:	90                   	nop
  10190b:	c9                   	leave  
  10190c:	c3                   	ret    

0010190d <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10190d:	f3 0f 1e fb          	endbr32 
  101911:	55                   	push   %ebp
  101912:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101914:	90                   	nop
  101915:	5d                   	pop    %ebp
  101916:	c3                   	ret    

00101917 <trapname>:

static const char *
trapname(int trapno) {
  101917:	f3 0f 1e fb          	endbr32 
  10191b:	55                   	push   %ebp
  10191c:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10191e:	8b 45 08             	mov    0x8(%ebp),%eax
  101921:	83 f8 13             	cmp    $0x13,%eax
  101924:	77 0c                	ja     101932 <trapname+0x1b>
        return excnames[trapno];
  101926:	8b 45 08             	mov    0x8(%ebp),%eax
  101929:	8b 04 85 e0 3a 10 00 	mov    0x103ae0(,%eax,4),%eax
  101930:	eb 18                	jmp    10194a <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101932:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101936:	7e 0d                	jle    101945 <trapname+0x2e>
  101938:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10193c:	7f 07                	jg     101945 <trapname+0x2e>
        return "Hardware Interrupt";
  10193e:	b8 8a 37 10 00       	mov    $0x10378a,%eax
  101943:	eb 05                	jmp    10194a <trapname+0x33>
    }
    return "(unknown trap)";
  101945:	b8 9d 37 10 00       	mov    $0x10379d,%eax
}
  10194a:	5d                   	pop    %ebp
  10194b:	c3                   	ret    

0010194c <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10194c:	f3 0f 1e fb          	endbr32 
  101950:	55                   	push   %ebp
  101951:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101953:	8b 45 08             	mov    0x8(%ebp),%eax
  101956:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10195a:	83 f8 08             	cmp    $0x8,%eax
  10195d:	0f 94 c0             	sete   %al
  101960:	0f b6 c0             	movzbl %al,%eax
}
  101963:	5d                   	pop    %ebp
  101964:	c3                   	ret    

00101965 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101965:	f3 0f 1e fb          	endbr32 
  101969:	55                   	push   %ebp
  10196a:	89 e5                	mov    %esp,%ebp
  10196c:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  10196f:	8b 45 08             	mov    0x8(%ebp),%eax
  101972:	89 44 24 04          	mov    %eax,0x4(%esp)
  101976:	c7 04 24 de 37 10 00 	movl   $0x1037de,(%esp)
  10197d:	e8 02 e9 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101982:	8b 45 08             	mov    0x8(%ebp),%eax
  101985:	89 04 24             	mov    %eax,(%esp)
  101988:	e8 8d 01 00 00       	call   101b1a <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  10198d:	8b 45 08             	mov    0x8(%ebp),%eax
  101990:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101994:	89 44 24 04          	mov    %eax,0x4(%esp)
  101998:	c7 04 24 ef 37 10 00 	movl   $0x1037ef,(%esp)
  10199f:	e8 e0 e8 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a7:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019ab:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019af:	c7 04 24 02 38 10 00 	movl   $0x103802,(%esp)
  1019b6:	e8 c9 e8 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1019bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019be:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1019c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c6:	c7 04 24 15 38 10 00 	movl   $0x103815,(%esp)
  1019cd:	e8 b2 e8 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1019d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d5:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1019d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019dd:	c7 04 24 28 38 10 00 	movl   $0x103828,(%esp)
  1019e4:	e8 9b e8 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ec:	8b 40 30             	mov    0x30(%eax),%eax
  1019ef:	89 04 24             	mov    %eax,(%esp)
  1019f2:	e8 20 ff ff ff       	call   101917 <trapname>
  1019f7:	8b 55 08             	mov    0x8(%ebp),%edx
  1019fa:	8b 52 30             	mov    0x30(%edx),%edx
  1019fd:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a01:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a05:	c7 04 24 3b 38 10 00 	movl   $0x10383b,(%esp)
  101a0c:	e8 73 e8 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a11:	8b 45 08             	mov    0x8(%ebp),%eax
  101a14:	8b 40 34             	mov    0x34(%eax),%eax
  101a17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a1b:	c7 04 24 4d 38 10 00 	movl   $0x10384d,(%esp)
  101a22:	e8 5d e8 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a27:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2a:	8b 40 38             	mov    0x38(%eax),%eax
  101a2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a31:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  101a38:	e8 47 e8 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a40:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a44:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a48:	c7 04 24 6b 38 10 00 	movl   $0x10386b,(%esp)
  101a4f:	e8 30 e8 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a54:	8b 45 08             	mov    0x8(%ebp),%eax
  101a57:	8b 40 40             	mov    0x40(%eax),%eax
  101a5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a5e:	c7 04 24 7e 38 10 00 	movl   $0x10387e,(%esp)
  101a65:	e8 1a e8 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a71:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a78:	eb 3d                	jmp    101ab7 <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7d:	8b 50 40             	mov    0x40(%eax),%edx
  101a80:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a83:	21 d0                	and    %edx,%eax
  101a85:	85 c0                	test   %eax,%eax
  101a87:	74 28                	je     101ab1 <print_trapframe+0x14c>
  101a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a8c:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101a93:	85 c0                	test   %eax,%eax
  101a95:	74 1a                	je     101ab1 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101a97:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a9a:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa5:	c7 04 24 8d 38 10 00 	movl   $0x10388d,(%esp)
  101aac:	e8 d3 e7 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ab1:	ff 45 f4             	incl   -0xc(%ebp)
  101ab4:	d1 65 f0             	shll   -0x10(%ebp)
  101ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101aba:	83 f8 17             	cmp    $0x17,%eax
  101abd:	76 bb                	jbe    101a7a <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101abf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac2:	8b 40 40             	mov    0x40(%eax),%eax
  101ac5:	c1 e8 0c             	shr    $0xc,%eax
  101ac8:	83 e0 03             	and    $0x3,%eax
  101acb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101acf:	c7 04 24 91 38 10 00 	movl   $0x103891,(%esp)
  101ad6:	e8 a9 e7 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101adb:	8b 45 08             	mov    0x8(%ebp),%eax
  101ade:	89 04 24             	mov    %eax,(%esp)
  101ae1:	e8 66 fe ff ff       	call   10194c <trap_in_kernel>
  101ae6:	85 c0                	test   %eax,%eax
  101ae8:	75 2d                	jne    101b17 <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101aea:	8b 45 08             	mov    0x8(%ebp),%eax
  101aed:	8b 40 44             	mov    0x44(%eax),%eax
  101af0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af4:	c7 04 24 9a 38 10 00 	movl   $0x10389a,(%esp)
  101afb:	e8 84 e7 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b00:	8b 45 08             	mov    0x8(%ebp),%eax
  101b03:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b07:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b0b:	c7 04 24 a9 38 10 00 	movl   $0x1038a9,(%esp)
  101b12:	e8 6d e7 ff ff       	call   100284 <cprintf>
    }
}
  101b17:	90                   	nop
  101b18:	c9                   	leave  
  101b19:	c3                   	ret    

00101b1a <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b1a:	f3 0f 1e fb          	endbr32 
  101b1e:	55                   	push   %ebp
  101b1f:	89 e5                	mov    %esp,%ebp
  101b21:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b24:	8b 45 08             	mov    0x8(%ebp),%eax
  101b27:	8b 00                	mov    (%eax),%eax
  101b29:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2d:	c7 04 24 bc 38 10 00 	movl   $0x1038bc,(%esp)
  101b34:	e8 4b e7 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b39:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3c:	8b 40 04             	mov    0x4(%eax),%eax
  101b3f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b43:	c7 04 24 cb 38 10 00 	movl   $0x1038cb,(%esp)
  101b4a:	e8 35 e7 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b52:	8b 40 08             	mov    0x8(%eax),%eax
  101b55:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b59:	c7 04 24 da 38 10 00 	movl   $0x1038da,(%esp)
  101b60:	e8 1f e7 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b65:	8b 45 08             	mov    0x8(%ebp),%eax
  101b68:	8b 40 0c             	mov    0xc(%eax),%eax
  101b6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6f:	c7 04 24 e9 38 10 00 	movl   $0x1038e9,(%esp)
  101b76:	e8 09 e7 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7e:	8b 40 10             	mov    0x10(%eax),%eax
  101b81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b85:	c7 04 24 f8 38 10 00 	movl   $0x1038f8,(%esp)
  101b8c:	e8 f3 e6 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b91:	8b 45 08             	mov    0x8(%ebp),%eax
  101b94:	8b 40 14             	mov    0x14(%eax),%eax
  101b97:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9b:	c7 04 24 07 39 10 00 	movl   $0x103907,(%esp)
  101ba2:	e8 dd e6 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  101baa:	8b 40 18             	mov    0x18(%eax),%eax
  101bad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb1:	c7 04 24 16 39 10 00 	movl   $0x103916,(%esp)
  101bb8:	e8 c7 e6 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc0:	8b 40 1c             	mov    0x1c(%eax),%eax
  101bc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc7:	c7 04 24 25 39 10 00 	movl   $0x103925,(%esp)
  101bce:	e8 b1 e6 ff ff       	call   100284 <cprintf>
}
  101bd3:	90                   	nop
  101bd4:	c9                   	leave  
  101bd5:	c3                   	ret    

00101bd6 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101bd6:	f3 0f 1e fb          	endbr32 
  101bda:	55                   	push   %ebp
  101bdb:	89 e5                	mov    %esp,%ebp
  101bdd:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101be0:	8b 45 08             	mov    0x8(%ebp),%eax
  101be3:	8b 40 30             	mov    0x30(%eax),%eax
  101be6:	83 f8 79             	cmp    $0x79,%eax
  101be9:	0f 87 99 00 00 00    	ja     101c88 <trap_dispatch+0xb2>
  101bef:	83 f8 78             	cmp    $0x78,%eax
  101bf2:	73 78                	jae    101c6c <trap_dispatch+0x96>
  101bf4:	83 f8 2f             	cmp    $0x2f,%eax
  101bf7:	0f 87 8b 00 00 00    	ja     101c88 <trap_dispatch+0xb2>
  101bfd:	83 f8 2e             	cmp    $0x2e,%eax
  101c00:	0f 83 b7 00 00 00    	jae    101cbd <trap_dispatch+0xe7>
  101c06:	83 f8 24             	cmp    $0x24,%eax
  101c09:	74 15                	je     101c20 <trap_dispatch+0x4a>
  101c0b:	83 f8 24             	cmp    $0x24,%eax
  101c0e:	77 78                	ja     101c88 <trap_dispatch+0xb2>
  101c10:	83 f8 20             	cmp    $0x20,%eax
  101c13:	0f 84 a7 00 00 00    	je     101cc0 <trap_dispatch+0xea>
  101c19:	83 f8 21             	cmp    $0x21,%eax
  101c1c:	74 28                	je     101c46 <trap_dispatch+0x70>
  101c1e:	eb 68                	jmp    101c88 <trap_dispatch+0xb2>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c20:	e8 6d fa ff ff       	call   101692 <cons_getc>
  101c25:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c28:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c2c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c30:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c34:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c38:	c7 04 24 34 39 10 00 	movl   $0x103934,(%esp)
  101c3f:	e8 40 e6 ff ff       	call   100284 <cprintf>
        break;
  101c44:	eb 7b                	jmp    101cc1 <trap_dispatch+0xeb>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c46:	e8 47 fa ff ff       	call   101692 <cons_getc>
  101c4b:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c4e:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c52:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c56:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c5e:	c7 04 24 46 39 10 00 	movl   $0x103946,(%esp)
  101c65:	e8 1a e6 ff ff       	call   100284 <cprintf>
        break;
  101c6a:	eb 55                	jmp    101cc1 <trap_dispatch+0xeb>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101c6c:	c7 44 24 08 55 39 10 	movl   $0x103955,0x8(%esp)
  101c73:	00 
  101c74:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101c7b:	00 
  101c7c:	c7 04 24 65 39 10 00 	movl   $0x103965,(%esp)
  101c83:	e8 68 e7 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101c88:	8b 45 08             	mov    0x8(%ebp),%eax
  101c8b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101c8f:	83 e0 03             	and    $0x3,%eax
  101c92:	85 c0                	test   %eax,%eax
  101c94:	75 2b                	jne    101cc1 <trap_dispatch+0xeb>
            print_trapframe(tf);
  101c96:	8b 45 08             	mov    0x8(%ebp),%eax
  101c99:	89 04 24             	mov    %eax,(%esp)
  101c9c:	e8 c4 fc ff ff       	call   101965 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101ca1:	c7 44 24 08 76 39 10 	movl   $0x103976,0x8(%esp)
  101ca8:	00 
  101ca9:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101cb0:	00 
  101cb1:	c7 04 24 65 39 10 00 	movl   $0x103965,(%esp)
  101cb8:	e8 33 e7 ff ff       	call   1003f0 <__panic>
        break;
  101cbd:	90                   	nop
  101cbe:	eb 01                	jmp    101cc1 <trap_dispatch+0xeb>
        break;
  101cc0:	90                   	nop
        }
    }
}
  101cc1:	90                   	nop
  101cc2:	c9                   	leave  
  101cc3:	c3                   	ret    

00101cc4 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cc4:	f3 0f 1e fb          	endbr32 
  101cc8:	55                   	push   %ebp
  101cc9:	89 e5                	mov    %esp,%ebp
  101ccb:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101cce:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd1:	89 04 24             	mov    %eax,(%esp)
  101cd4:	e8 fd fe ff ff       	call   101bd6 <trap_dispatch>
}
  101cd9:	90                   	nop
  101cda:	c9                   	leave  
  101cdb:	c3                   	ret    

00101cdc <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101cdc:	6a 00                	push   $0x0
  pushl $0
  101cde:	6a 00                	push   $0x0
  jmp __alltraps
  101ce0:	e9 69 0a 00 00       	jmp    10274e <__alltraps>

00101ce5 <vector1>:
.globl vector1
vector1:
  pushl $0
  101ce5:	6a 00                	push   $0x0
  pushl $1
  101ce7:	6a 01                	push   $0x1
  jmp __alltraps
  101ce9:	e9 60 0a 00 00       	jmp    10274e <__alltraps>

00101cee <vector2>:
.globl vector2
vector2:
  pushl $0
  101cee:	6a 00                	push   $0x0
  pushl $2
  101cf0:	6a 02                	push   $0x2
  jmp __alltraps
  101cf2:	e9 57 0a 00 00       	jmp    10274e <__alltraps>

00101cf7 <vector3>:
.globl vector3
vector3:
  pushl $0
  101cf7:	6a 00                	push   $0x0
  pushl $3
  101cf9:	6a 03                	push   $0x3
  jmp __alltraps
  101cfb:	e9 4e 0a 00 00       	jmp    10274e <__alltraps>

00101d00 <vector4>:
.globl vector4
vector4:
  pushl $0
  101d00:	6a 00                	push   $0x0
  pushl $4
  101d02:	6a 04                	push   $0x4
  jmp __alltraps
  101d04:	e9 45 0a 00 00       	jmp    10274e <__alltraps>

00101d09 <vector5>:
.globl vector5
vector5:
  pushl $0
  101d09:	6a 00                	push   $0x0
  pushl $5
  101d0b:	6a 05                	push   $0x5
  jmp __alltraps
  101d0d:	e9 3c 0a 00 00       	jmp    10274e <__alltraps>

00101d12 <vector6>:
.globl vector6
vector6:
  pushl $0
  101d12:	6a 00                	push   $0x0
  pushl $6
  101d14:	6a 06                	push   $0x6
  jmp __alltraps
  101d16:	e9 33 0a 00 00       	jmp    10274e <__alltraps>

00101d1b <vector7>:
.globl vector7
vector7:
  pushl $0
  101d1b:	6a 00                	push   $0x0
  pushl $7
  101d1d:	6a 07                	push   $0x7
  jmp __alltraps
  101d1f:	e9 2a 0a 00 00       	jmp    10274e <__alltraps>

00101d24 <vector8>:
.globl vector8
vector8:
  pushl $8
  101d24:	6a 08                	push   $0x8
  jmp __alltraps
  101d26:	e9 23 0a 00 00       	jmp    10274e <__alltraps>

00101d2b <vector9>:
.globl vector9
vector9:
  pushl $0
  101d2b:	6a 00                	push   $0x0
  pushl $9
  101d2d:	6a 09                	push   $0x9
  jmp __alltraps
  101d2f:	e9 1a 0a 00 00       	jmp    10274e <__alltraps>

00101d34 <vector10>:
.globl vector10
vector10:
  pushl $10
  101d34:	6a 0a                	push   $0xa
  jmp __alltraps
  101d36:	e9 13 0a 00 00       	jmp    10274e <__alltraps>

00101d3b <vector11>:
.globl vector11
vector11:
  pushl $11
  101d3b:	6a 0b                	push   $0xb
  jmp __alltraps
  101d3d:	e9 0c 0a 00 00       	jmp    10274e <__alltraps>

00101d42 <vector12>:
.globl vector12
vector12:
  pushl $12
  101d42:	6a 0c                	push   $0xc
  jmp __alltraps
  101d44:	e9 05 0a 00 00       	jmp    10274e <__alltraps>

00101d49 <vector13>:
.globl vector13
vector13:
  pushl $13
  101d49:	6a 0d                	push   $0xd
  jmp __alltraps
  101d4b:	e9 fe 09 00 00       	jmp    10274e <__alltraps>

00101d50 <vector14>:
.globl vector14
vector14:
  pushl $14
  101d50:	6a 0e                	push   $0xe
  jmp __alltraps
  101d52:	e9 f7 09 00 00       	jmp    10274e <__alltraps>

00101d57 <vector15>:
.globl vector15
vector15:
  pushl $0
  101d57:	6a 00                	push   $0x0
  pushl $15
  101d59:	6a 0f                	push   $0xf
  jmp __alltraps
  101d5b:	e9 ee 09 00 00       	jmp    10274e <__alltraps>

00101d60 <vector16>:
.globl vector16
vector16:
  pushl $0
  101d60:	6a 00                	push   $0x0
  pushl $16
  101d62:	6a 10                	push   $0x10
  jmp __alltraps
  101d64:	e9 e5 09 00 00       	jmp    10274e <__alltraps>

00101d69 <vector17>:
.globl vector17
vector17:
  pushl $17
  101d69:	6a 11                	push   $0x11
  jmp __alltraps
  101d6b:	e9 de 09 00 00       	jmp    10274e <__alltraps>

00101d70 <vector18>:
.globl vector18
vector18:
  pushl $0
  101d70:	6a 00                	push   $0x0
  pushl $18
  101d72:	6a 12                	push   $0x12
  jmp __alltraps
  101d74:	e9 d5 09 00 00       	jmp    10274e <__alltraps>

00101d79 <vector19>:
.globl vector19
vector19:
  pushl $0
  101d79:	6a 00                	push   $0x0
  pushl $19
  101d7b:	6a 13                	push   $0x13
  jmp __alltraps
  101d7d:	e9 cc 09 00 00       	jmp    10274e <__alltraps>

00101d82 <vector20>:
.globl vector20
vector20:
  pushl $0
  101d82:	6a 00                	push   $0x0
  pushl $20
  101d84:	6a 14                	push   $0x14
  jmp __alltraps
  101d86:	e9 c3 09 00 00       	jmp    10274e <__alltraps>

00101d8b <vector21>:
.globl vector21
vector21:
  pushl $0
  101d8b:	6a 00                	push   $0x0
  pushl $21
  101d8d:	6a 15                	push   $0x15
  jmp __alltraps
  101d8f:	e9 ba 09 00 00       	jmp    10274e <__alltraps>

00101d94 <vector22>:
.globl vector22
vector22:
  pushl $0
  101d94:	6a 00                	push   $0x0
  pushl $22
  101d96:	6a 16                	push   $0x16
  jmp __alltraps
  101d98:	e9 b1 09 00 00       	jmp    10274e <__alltraps>

00101d9d <vector23>:
.globl vector23
vector23:
  pushl $0
  101d9d:	6a 00                	push   $0x0
  pushl $23
  101d9f:	6a 17                	push   $0x17
  jmp __alltraps
  101da1:	e9 a8 09 00 00       	jmp    10274e <__alltraps>

00101da6 <vector24>:
.globl vector24
vector24:
  pushl $0
  101da6:	6a 00                	push   $0x0
  pushl $24
  101da8:	6a 18                	push   $0x18
  jmp __alltraps
  101daa:	e9 9f 09 00 00       	jmp    10274e <__alltraps>

00101daf <vector25>:
.globl vector25
vector25:
  pushl $0
  101daf:	6a 00                	push   $0x0
  pushl $25
  101db1:	6a 19                	push   $0x19
  jmp __alltraps
  101db3:	e9 96 09 00 00       	jmp    10274e <__alltraps>

00101db8 <vector26>:
.globl vector26
vector26:
  pushl $0
  101db8:	6a 00                	push   $0x0
  pushl $26
  101dba:	6a 1a                	push   $0x1a
  jmp __alltraps
  101dbc:	e9 8d 09 00 00       	jmp    10274e <__alltraps>

00101dc1 <vector27>:
.globl vector27
vector27:
  pushl $0
  101dc1:	6a 00                	push   $0x0
  pushl $27
  101dc3:	6a 1b                	push   $0x1b
  jmp __alltraps
  101dc5:	e9 84 09 00 00       	jmp    10274e <__alltraps>

00101dca <vector28>:
.globl vector28
vector28:
  pushl $0
  101dca:	6a 00                	push   $0x0
  pushl $28
  101dcc:	6a 1c                	push   $0x1c
  jmp __alltraps
  101dce:	e9 7b 09 00 00       	jmp    10274e <__alltraps>

00101dd3 <vector29>:
.globl vector29
vector29:
  pushl $0
  101dd3:	6a 00                	push   $0x0
  pushl $29
  101dd5:	6a 1d                	push   $0x1d
  jmp __alltraps
  101dd7:	e9 72 09 00 00       	jmp    10274e <__alltraps>

00101ddc <vector30>:
.globl vector30
vector30:
  pushl $0
  101ddc:	6a 00                	push   $0x0
  pushl $30
  101dde:	6a 1e                	push   $0x1e
  jmp __alltraps
  101de0:	e9 69 09 00 00       	jmp    10274e <__alltraps>

00101de5 <vector31>:
.globl vector31
vector31:
  pushl $0
  101de5:	6a 00                	push   $0x0
  pushl $31
  101de7:	6a 1f                	push   $0x1f
  jmp __alltraps
  101de9:	e9 60 09 00 00       	jmp    10274e <__alltraps>

00101dee <vector32>:
.globl vector32
vector32:
  pushl $0
  101dee:	6a 00                	push   $0x0
  pushl $32
  101df0:	6a 20                	push   $0x20
  jmp __alltraps
  101df2:	e9 57 09 00 00       	jmp    10274e <__alltraps>

00101df7 <vector33>:
.globl vector33
vector33:
  pushl $0
  101df7:	6a 00                	push   $0x0
  pushl $33
  101df9:	6a 21                	push   $0x21
  jmp __alltraps
  101dfb:	e9 4e 09 00 00       	jmp    10274e <__alltraps>

00101e00 <vector34>:
.globl vector34
vector34:
  pushl $0
  101e00:	6a 00                	push   $0x0
  pushl $34
  101e02:	6a 22                	push   $0x22
  jmp __alltraps
  101e04:	e9 45 09 00 00       	jmp    10274e <__alltraps>

00101e09 <vector35>:
.globl vector35
vector35:
  pushl $0
  101e09:	6a 00                	push   $0x0
  pushl $35
  101e0b:	6a 23                	push   $0x23
  jmp __alltraps
  101e0d:	e9 3c 09 00 00       	jmp    10274e <__alltraps>

00101e12 <vector36>:
.globl vector36
vector36:
  pushl $0
  101e12:	6a 00                	push   $0x0
  pushl $36
  101e14:	6a 24                	push   $0x24
  jmp __alltraps
  101e16:	e9 33 09 00 00       	jmp    10274e <__alltraps>

00101e1b <vector37>:
.globl vector37
vector37:
  pushl $0
  101e1b:	6a 00                	push   $0x0
  pushl $37
  101e1d:	6a 25                	push   $0x25
  jmp __alltraps
  101e1f:	e9 2a 09 00 00       	jmp    10274e <__alltraps>

00101e24 <vector38>:
.globl vector38
vector38:
  pushl $0
  101e24:	6a 00                	push   $0x0
  pushl $38
  101e26:	6a 26                	push   $0x26
  jmp __alltraps
  101e28:	e9 21 09 00 00       	jmp    10274e <__alltraps>

00101e2d <vector39>:
.globl vector39
vector39:
  pushl $0
  101e2d:	6a 00                	push   $0x0
  pushl $39
  101e2f:	6a 27                	push   $0x27
  jmp __alltraps
  101e31:	e9 18 09 00 00       	jmp    10274e <__alltraps>

00101e36 <vector40>:
.globl vector40
vector40:
  pushl $0
  101e36:	6a 00                	push   $0x0
  pushl $40
  101e38:	6a 28                	push   $0x28
  jmp __alltraps
  101e3a:	e9 0f 09 00 00       	jmp    10274e <__alltraps>

00101e3f <vector41>:
.globl vector41
vector41:
  pushl $0
  101e3f:	6a 00                	push   $0x0
  pushl $41
  101e41:	6a 29                	push   $0x29
  jmp __alltraps
  101e43:	e9 06 09 00 00       	jmp    10274e <__alltraps>

00101e48 <vector42>:
.globl vector42
vector42:
  pushl $0
  101e48:	6a 00                	push   $0x0
  pushl $42
  101e4a:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e4c:	e9 fd 08 00 00       	jmp    10274e <__alltraps>

00101e51 <vector43>:
.globl vector43
vector43:
  pushl $0
  101e51:	6a 00                	push   $0x0
  pushl $43
  101e53:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e55:	e9 f4 08 00 00       	jmp    10274e <__alltraps>

00101e5a <vector44>:
.globl vector44
vector44:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $44
  101e5c:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e5e:	e9 eb 08 00 00       	jmp    10274e <__alltraps>

00101e63 <vector45>:
.globl vector45
vector45:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $45
  101e65:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e67:	e9 e2 08 00 00       	jmp    10274e <__alltraps>

00101e6c <vector46>:
.globl vector46
vector46:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $46
  101e6e:	6a 2e                	push   $0x2e
  jmp __alltraps
  101e70:	e9 d9 08 00 00       	jmp    10274e <__alltraps>

00101e75 <vector47>:
.globl vector47
vector47:
  pushl $0
  101e75:	6a 00                	push   $0x0
  pushl $47
  101e77:	6a 2f                	push   $0x2f
  jmp __alltraps
  101e79:	e9 d0 08 00 00       	jmp    10274e <__alltraps>

00101e7e <vector48>:
.globl vector48
vector48:
  pushl $0
  101e7e:	6a 00                	push   $0x0
  pushl $48
  101e80:	6a 30                	push   $0x30
  jmp __alltraps
  101e82:	e9 c7 08 00 00       	jmp    10274e <__alltraps>

00101e87 <vector49>:
.globl vector49
vector49:
  pushl $0
  101e87:	6a 00                	push   $0x0
  pushl $49
  101e89:	6a 31                	push   $0x31
  jmp __alltraps
  101e8b:	e9 be 08 00 00       	jmp    10274e <__alltraps>

00101e90 <vector50>:
.globl vector50
vector50:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $50
  101e92:	6a 32                	push   $0x32
  jmp __alltraps
  101e94:	e9 b5 08 00 00       	jmp    10274e <__alltraps>

00101e99 <vector51>:
.globl vector51
vector51:
  pushl $0
  101e99:	6a 00                	push   $0x0
  pushl $51
  101e9b:	6a 33                	push   $0x33
  jmp __alltraps
  101e9d:	e9 ac 08 00 00       	jmp    10274e <__alltraps>

00101ea2 <vector52>:
.globl vector52
vector52:
  pushl $0
  101ea2:	6a 00                	push   $0x0
  pushl $52
  101ea4:	6a 34                	push   $0x34
  jmp __alltraps
  101ea6:	e9 a3 08 00 00       	jmp    10274e <__alltraps>

00101eab <vector53>:
.globl vector53
vector53:
  pushl $0
  101eab:	6a 00                	push   $0x0
  pushl $53
  101ead:	6a 35                	push   $0x35
  jmp __alltraps
  101eaf:	e9 9a 08 00 00       	jmp    10274e <__alltraps>

00101eb4 <vector54>:
.globl vector54
vector54:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $54
  101eb6:	6a 36                	push   $0x36
  jmp __alltraps
  101eb8:	e9 91 08 00 00       	jmp    10274e <__alltraps>

00101ebd <vector55>:
.globl vector55
vector55:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $55
  101ebf:	6a 37                	push   $0x37
  jmp __alltraps
  101ec1:	e9 88 08 00 00       	jmp    10274e <__alltraps>

00101ec6 <vector56>:
.globl vector56
vector56:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $56
  101ec8:	6a 38                	push   $0x38
  jmp __alltraps
  101eca:	e9 7f 08 00 00       	jmp    10274e <__alltraps>

00101ecf <vector57>:
.globl vector57
vector57:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $57
  101ed1:	6a 39                	push   $0x39
  jmp __alltraps
  101ed3:	e9 76 08 00 00       	jmp    10274e <__alltraps>

00101ed8 <vector58>:
.globl vector58
vector58:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $58
  101eda:	6a 3a                	push   $0x3a
  jmp __alltraps
  101edc:	e9 6d 08 00 00       	jmp    10274e <__alltraps>

00101ee1 <vector59>:
.globl vector59
vector59:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $59
  101ee3:	6a 3b                	push   $0x3b
  jmp __alltraps
  101ee5:	e9 64 08 00 00       	jmp    10274e <__alltraps>

00101eea <vector60>:
.globl vector60
vector60:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $60
  101eec:	6a 3c                	push   $0x3c
  jmp __alltraps
  101eee:	e9 5b 08 00 00       	jmp    10274e <__alltraps>

00101ef3 <vector61>:
.globl vector61
vector61:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $61
  101ef5:	6a 3d                	push   $0x3d
  jmp __alltraps
  101ef7:	e9 52 08 00 00       	jmp    10274e <__alltraps>

00101efc <vector62>:
.globl vector62
vector62:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $62
  101efe:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f00:	e9 49 08 00 00       	jmp    10274e <__alltraps>

00101f05 <vector63>:
.globl vector63
vector63:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $63
  101f07:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f09:	e9 40 08 00 00       	jmp    10274e <__alltraps>

00101f0e <vector64>:
.globl vector64
vector64:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $64
  101f10:	6a 40                	push   $0x40
  jmp __alltraps
  101f12:	e9 37 08 00 00       	jmp    10274e <__alltraps>

00101f17 <vector65>:
.globl vector65
vector65:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $65
  101f19:	6a 41                	push   $0x41
  jmp __alltraps
  101f1b:	e9 2e 08 00 00       	jmp    10274e <__alltraps>

00101f20 <vector66>:
.globl vector66
vector66:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $66
  101f22:	6a 42                	push   $0x42
  jmp __alltraps
  101f24:	e9 25 08 00 00       	jmp    10274e <__alltraps>

00101f29 <vector67>:
.globl vector67
vector67:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $67
  101f2b:	6a 43                	push   $0x43
  jmp __alltraps
  101f2d:	e9 1c 08 00 00       	jmp    10274e <__alltraps>

00101f32 <vector68>:
.globl vector68
vector68:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $68
  101f34:	6a 44                	push   $0x44
  jmp __alltraps
  101f36:	e9 13 08 00 00       	jmp    10274e <__alltraps>

00101f3b <vector69>:
.globl vector69
vector69:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $69
  101f3d:	6a 45                	push   $0x45
  jmp __alltraps
  101f3f:	e9 0a 08 00 00       	jmp    10274e <__alltraps>

00101f44 <vector70>:
.globl vector70
vector70:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $70
  101f46:	6a 46                	push   $0x46
  jmp __alltraps
  101f48:	e9 01 08 00 00       	jmp    10274e <__alltraps>

00101f4d <vector71>:
.globl vector71
vector71:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $71
  101f4f:	6a 47                	push   $0x47
  jmp __alltraps
  101f51:	e9 f8 07 00 00       	jmp    10274e <__alltraps>

00101f56 <vector72>:
.globl vector72
vector72:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $72
  101f58:	6a 48                	push   $0x48
  jmp __alltraps
  101f5a:	e9 ef 07 00 00       	jmp    10274e <__alltraps>

00101f5f <vector73>:
.globl vector73
vector73:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $73
  101f61:	6a 49                	push   $0x49
  jmp __alltraps
  101f63:	e9 e6 07 00 00       	jmp    10274e <__alltraps>

00101f68 <vector74>:
.globl vector74
vector74:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $74
  101f6a:	6a 4a                	push   $0x4a
  jmp __alltraps
  101f6c:	e9 dd 07 00 00       	jmp    10274e <__alltraps>

00101f71 <vector75>:
.globl vector75
vector75:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $75
  101f73:	6a 4b                	push   $0x4b
  jmp __alltraps
  101f75:	e9 d4 07 00 00       	jmp    10274e <__alltraps>

00101f7a <vector76>:
.globl vector76
vector76:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $76
  101f7c:	6a 4c                	push   $0x4c
  jmp __alltraps
  101f7e:	e9 cb 07 00 00       	jmp    10274e <__alltraps>

00101f83 <vector77>:
.globl vector77
vector77:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $77
  101f85:	6a 4d                	push   $0x4d
  jmp __alltraps
  101f87:	e9 c2 07 00 00       	jmp    10274e <__alltraps>

00101f8c <vector78>:
.globl vector78
vector78:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $78
  101f8e:	6a 4e                	push   $0x4e
  jmp __alltraps
  101f90:	e9 b9 07 00 00       	jmp    10274e <__alltraps>

00101f95 <vector79>:
.globl vector79
vector79:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $79
  101f97:	6a 4f                	push   $0x4f
  jmp __alltraps
  101f99:	e9 b0 07 00 00       	jmp    10274e <__alltraps>

00101f9e <vector80>:
.globl vector80
vector80:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $80
  101fa0:	6a 50                	push   $0x50
  jmp __alltraps
  101fa2:	e9 a7 07 00 00       	jmp    10274e <__alltraps>

00101fa7 <vector81>:
.globl vector81
vector81:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $81
  101fa9:	6a 51                	push   $0x51
  jmp __alltraps
  101fab:	e9 9e 07 00 00       	jmp    10274e <__alltraps>

00101fb0 <vector82>:
.globl vector82
vector82:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $82
  101fb2:	6a 52                	push   $0x52
  jmp __alltraps
  101fb4:	e9 95 07 00 00       	jmp    10274e <__alltraps>

00101fb9 <vector83>:
.globl vector83
vector83:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $83
  101fbb:	6a 53                	push   $0x53
  jmp __alltraps
  101fbd:	e9 8c 07 00 00       	jmp    10274e <__alltraps>

00101fc2 <vector84>:
.globl vector84
vector84:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $84
  101fc4:	6a 54                	push   $0x54
  jmp __alltraps
  101fc6:	e9 83 07 00 00       	jmp    10274e <__alltraps>

00101fcb <vector85>:
.globl vector85
vector85:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $85
  101fcd:	6a 55                	push   $0x55
  jmp __alltraps
  101fcf:	e9 7a 07 00 00       	jmp    10274e <__alltraps>

00101fd4 <vector86>:
.globl vector86
vector86:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $86
  101fd6:	6a 56                	push   $0x56
  jmp __alltraps
  101fd8:	e9 71 07 00 00       	jmp    10274e <__alltraps>

00101fdd <vector87>:
.globl vector87
vector87:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $87
  101fdf:	6a 57                	push   $0x57
  jmp __alltraps
  101fe1:	e9 68 07 00 00       	jmp    10274e <__alltraps>

00101fe6 <vector88>:
.globl vector88
vector88:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $88
  101fe8:	6a 58                	push   $0x58
  jmp __alltraps
  101fea:	e9 5f 07 00 00       	jmp    10274e <__alltraps>

00101fef <vector89>:
.globl vector89
vector89:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $89
  101ff1:	6a 59                	push   $0x59
  jmp __alltraps
  101ff3:	e9 56 07 00 00       	jmp    10274e <__alltraps>

00101ff8 <vector90>:
.globl vector90
vector90:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $90
  101ffa:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ffc:	e9 4d 07 00 00       	jmp    10274e <__alltraps>

00102001 <vector91>:
.globl vector91
vector91:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $91
  102003:	6a 5b                	push   $0x5b
  jmp __alltraps
  102005:	e9 44 07 00 00       	jmp    10274e <__alltraps>

0010200a <vector92>:
.globl vector92
vector92:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $92
  10200c:	6a 5c                	push   $0x5c
  jmp __alltraps
  10200e:	e9 3b 07 00 00       	jmp    10274e <__alltraps>

00102013 <vector93>:
.globl vector93
vector93:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $93
  102015:	6a 5d                	push   $0x5d
  jmp __alltraps
  102017:	e9 32 07 00 00       	jmp    10274e <__alltraps>

0010201c <vector94>:
.globl vector94
vector94:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $94
  10201e:	6a 5e                	push   $0x5e
  jmp __alltraps
  102020:	e9 29 07 00 00       	jmp    10274e <__alltraps>

00102025 <vector95>:
.globl vector95
vector95:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $95
  102027:	6a 5f                	push   $0x5f
  jmp __alltraps
  102029:	e9 20 07 00 00       	jmp    10274e <__alltraps>

0010202e <vector96>:
.globl vector96
vector96:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $96
  102030:	6a 60                	push   $0x60
  jmp __alltraps
  102032:	e9 17 07 00 00       	jmp    10274e <__alltraps>

00102037 <vector97>:
.globl vector97
vector97:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $97
  102039:	6a 61                	push   $0x61
  jmp __alltraps
  10203b:	e9 0e 07 00 00       	jmp    10274e <__alltraps>

00102040 <vector98>:
.globl vector98
vector98:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $98
  102042:	6a 62                	push   $0x62
  jmp __alltraps
  102044:	e9 05 07 00 00       	jmp    10274e <__alltraps>

00102049 <vector99>:
.globl vector99
vector99:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $99
  10204b:	6a 63                	push   $0x63
  jmp __alltraps
  10204d:	e9 fc 06 00 00       	jmp    10274e <__alltraps>

00102052 <vector100>:
.globl vector100
vector100:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $100
  102054:	6a 64                	push   $0x64
  jmp __alltraps
  102056:	e9 f3 06 00 00       	jmp    10274e <__alltraps>

0010205b <vector101>:
.globl vector101
vector101:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $101
  10205d:	6a 65                	push   $0x65
  jmp __alltraps
  10205f:	e9 ea 06 00 00       	jmp    10274e <__alltraps>

00102064 <vector102>:
.globl vector102
vector102:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $102
  102066:	6a 66                	push   $0x66
  jmp __alltraps
  102068:	e9 e1 06 00 00       	jmp    10274e <__alltraps>

0010206d <vector103>:
.globl vector103
vector103:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $103
  10206f:	6a 67                	push   $0x67
  jmp __alltraps
  102071:	e9 d8 06 00 00       	jmp    10274e <__alltraps>

00102076 <vector104>:
.globl vector104
vector104:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $104
  102078:	6a 68                	push   $0x68
  jmp __alltraps
  10207a:	e9 cf 06 00 00       	jmp    10274e <__alltraps>

0010207f <vector105>:
.globl vector105
vector105:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $105
  102081:	6a 69                	push   $0x69
  jmp __alltraps
  102083:	e9 c6 06 00 00       	jmp    10274e <__alltraps>

00102088 <vector106>:
.globl vector106
vector106:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $106
  10208a:	6a 6a                	push   $0x6a
  jmp __alltraps
  10208c:	e9 bd 06 00 00       	jmp    10274e <__alltraps>

00102091 <vector107>:
.globl vector107
vector107:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $107
  102093:	6a 6b                	push   $0x6b
  jmp __alltraps
  102095:	e9 b4 06 00 00       	jmp    10274e <__alltraps>

0010209a <vector108>:
.globl vector108
vector108:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $108
  10209c:	6a 6c                	push   $0x6c
  jmp __alltraps
  10209e:	e9 ab 06 00 00       	jmp    10274e <__alltraps>

001020a3 <vector109>:
.globl vector109
vector109:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $109
  1020a5:	6a 6d                	push   $0x6d
  jmp __alltraps
  1020a7:	e9 a2 06 00 00       	jmp    10274e <__alltraps>

001020ac <vector110>:
.globl vector110
vector110:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $110
  1020ae:	6a 6e                	push   $0x6e
  jmp __alltraps
  1020b0:	e9 99 06 00 00       	jmp    10274e <__alltraps>

001020b5 <vector111>:
.globl vector111
vector111:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $111
  1020b7:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020b9:	e9 90 06 00 00       	jmp    10274e <__alltraps>

001020be <vector112>:
.globl vector112
vector112:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $112
  1020c0:	6a 70                	push   $0x70
  jmp __alltraps
  1020c2:	e9 87 06 00 00       	jmp    10274e <__alltraps>

001020c7 <vector113>:
.globl vector113
vector113:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $113
  1020c9:	6a 71                	push   $0x71
  jmp __alltraps
  1020cb:	e9 7e 06 00 00       	jmp    10274e <__alltraps>

001020d0 <vector114>:
.globl vector114
vector114:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $114
  1020d2:	6a 72                	push   $0x72
  jmp __alltraps
  1020d4:	e9 75 06 00 00       	jmp    10274e <__alltraps>

001020d9 <vector115>:
.globl vector115
vector115:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $115
  1020db:	6a 73                	push   $0x73
  jmp __alltraps
  1020dd:	e9 6c 06 00 00       	jmp    10274e <__alltraps>

001020e2 <vector116>:
.globl vector116
vector116:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $116
  1020e4:	6a 74                	push   $0x74
  jmp __alltraps
  1020e6:	e9 63 06 00 00       	jmp    10274e <__alltraps>

001020eb <vector117>:
.globl vector117
vector117:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $117
  1020ed:	6a 75                	push   $0x75
  jmp __alltraps
  1020ef:	e9 5a 06 00 00       	jmp    10274e <__alltraps>

001020f4 <vector118>:
.globl vector118
vector118:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $118
  1020f6:	6a 76                	push   $0x76
  jmp __alltraps
  1020f8:	e9 51 06 00 00       	jmp    10274e <__alltraps>

001020fd <vector119>:
.globl vector119
vector119:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $119
  1020ff:	6a 77                	push   $0x77
  jmp __alltraps
  102101:	e9 48 06 00 00       	jmp    10274e <__alltraps>

00102106 <vector120>:
.globl vector120
vector120:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $120
  102108:	6a 78                	push   $0x78
  jmp __alltraps
  10210a:	e9 3f 06 00 00       	jmp    10274e <__alltraps>

0010210f <vector121>:
.globl vector121
vector121:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $121
  102111:	6a 79                	push   $0x79
  jmp __alltraps
  102113:	e9 36 06 00 00       	jmp    10274e <__alltraps>

00102118 <vector122>:
.globl vector122
vector122:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $122
  10211a:	6a 7a                	push   $0x7a
  jmp __alltraps
  10211c:	e9 2d 06 00 00       	jmp    10274e <__alltraps>

00102121 <vector123>:
.globl vector123
vector123:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $123
  102123:	6a 7b                	push   $0x7b
  jmp __alltraps
  102125:	e9 24 06 00 00       	jmp    10274e <__alltraps>

0010212a <vector124>:
.globl vector124
vector124:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $124
  10212c:	6a 7c                	push   $0x7c
  jmp __alltraps
  10212e:	e9 1b 06 00 00       	jmp    10274e <__alltraps>

00102133 <vector125>:
.globl vector125
vector125:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $125
  102135:	6a 7d                	push   $0x7d
  jmp __alltraps
  102137:	e9 12 06 00 00       	jmp    10274e <__alltraps>

0010213c <vector126>:
.globl vector126
vector126:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $126
  10213e:	6a 7e                	push   $0x7e
  jmp __alltraps
  102140:	e9 09 06 00 00       	jmp    10274e <__alltraps>

00102145 <vector127>:
.globl vector127
vector127:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $127
  102147:	6a 7f                	push   $0x7f
  jmp __alltraps
  102149:	e9 00 06 00 00       	jmp    10274e <__alltraps>

0010214e <vector128>:
.globl vector128
vector128:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $128
  102150:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102155:	e9 f4 05 00 00       	jmp    10274e <__alltraps>

0010215a <vector129>:
.globl vector129
vector129:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $129
  10215c:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102161:	e9 e8 05 00 00       	jmp    10274e <__alltraps>

00102166 <vector130>:
.globl vector130
vector130:
  pushl $0
  102166:	6a 00                	push   $0x0
  pushl $130
  102168:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10216d:	e9 dc 05 00 00       	jmp    10274e <__alltraps>

00102172 <vector131>:
.globl vector131
vector131:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $131
  102174:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102179:	e9 d0 05 00 00       	jmp    10274e <__alltraps>

0010217e <vector132>:
.globl vector132
vector132:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $132
  102180:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102185:	e9 c4 05 00 00       	jmp    10274e <__alltraps>

0010218a <vector133>:
.globl vector133
vector133:
  pushl $0
  10218a:	6a 00                	push   $0x0
  pushl $133
  10218c:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102191:	e9 b8 05 00 00       	jmp    10274e <__alltraps>

00102196 <vector134>:
.globl vector134
vector134:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $134
  102198:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10219d:	e9 ac 05 00 00       	jmp    10274e <__alltraps>

001021a2 <vector135>:
.globl vector135
vector135:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $135
  1021a4:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1021a9:	e9 a0 05 00 00       	jmp    10274e <__alltraps>

001021ae <vector136>:
.globl vector136
vector136:
  pushl $0
  1021ae:	6a 00                	push   $0x0
  pushl $136
  1021b0:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021b5:	e9 94 05 00 00       	jmp    10274e <__alltraps>

001021ba <vector137>:
.globl vector137
vector137:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $137
  1021bc:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021c1:	e9 88 05 00 00       	jmp    10274e <__alltraps>

001021c6 <vector138>:
.globl vector138
vector138:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $138
  1021c8:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1021cd:	e9 7c 05 00 00       	jmp    10274e <__alltraps>

001021d2 <vector139>:
.globl vector139
vector139:
  pushl $0
  1021d2:	6a 00                	push   $0x0
  pushl $139
  1021d4:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1021d9:	e9 70 05 00 00       	jmp    10274e <__alltraps>

001021de <vector140>:
.globl vector140
vector140:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $140
  1021e0:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1021e5:	e9 64 05 00 00       	jmp    10274e <__alltraps>

001021ea <vector141>:
.globl vector141
vector141:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $141
  1021ec:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1021f1:	e9 58 05 00 00       	jmp    10274e <__alltraps>

001021f6 <vector142>:
.globl vector142
vector142:
  pushl $0
  1021f6:	6a 00                	push   $0x0
  pushl $142
  1021f8:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1021fd:	e9 4c 05 00 00       	jmp    10274e <__alltraps>

00102202 <vector143>:
.globl vector143
vector143:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $143
  102204:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102209:	e9 40 05 00 00       	jmp    10274e <__alltraps>

0010220e <vector144>:
.globl vector144
vector144:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $144
  102210:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102215:	e9 34 05 00 00       	jmp    10274e <__alltraps>

0010221a <vector145>:
.globl vector145
vector145:
  pushl $0
  10221a:	6a 00                	push   $0x0
  pushl $145
  10221c:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102221:	e9 28 05 00 00       	jmp    10274e <__alltraps>

00102226 <vector146>:
.globl vector146
vector146:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $146
  102228:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10222d:	e9 1c 05 00 00       	jmp    10274e <__alltraps>

00102232 <vector147>:
.globl vector147
vector147:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $147
  102234:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102239:	e9 10 05 00 00       	jmp    10274e <__alltraps>

0010223e <vector148>:
.globl vector148
vector148:
  pushl $0
  10223e:	6a 00                	push   $0x0
  pushl $148
  102240:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102245:	e9 04 05 00 00       	jmp    10274e <__alltraps>

0010224a <vector149>:
.globl vector149
vector149:
  pushl $0
  10224a:	6a 00                	push   $0x0
  pushl $149
  10224c:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102251:	e9 f8 04 00 00       	jmp    10274e <__alltraps>

00102256 <vector150>:
.globl vector150
vector150:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $150
  102258:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10225d:	e9 ec 04 00 00       	jmp    10274e <__alltraps>

00102262 <vector151>:
.globl vector151
vector151:
  pushl $0
  102262:	6a 00                	push   $0x0
  pushl $151
  102264:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102269:	e9 e0 04 00 00       	jmp    10274e <__alltraps>

0010226e <vector152>:
.globl vector152
vector152:
  pushl $0
  10226e:	6a 00                	push   $0x0
  pushl $152
  102270:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102275:	e9 d4 04 00 00       	jmp    10274e <__alltraps>

0010227a <vector153>:
.globl vector153
vector153:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $153
  10227c:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102281:	e9 c8 04 00 00       	jmp    10274e <__alltraps>

00102286 <vector154>:
.globl vector154
vector154:
  pushl $0
  102286:	6a 00                	push   $0x0
  pushl $154
  102288:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10228d:	e9 bc 04 00 00       	jmp    10274e <__alltraps>

00102292 <vector155>:
.globl vector155
vector155:
  pushl $0
  102292:	6a 00                	push   $0x0
  pushl $155
  102294:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102299:	e9 b0 04 00 00       	jmp    10274e <__alltraps>

0010229e <vector156>:
.globl vector156
vector156:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $156
  1022a0:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1022a5:	e9 a4 04 00 00       	jmp    10274e <__alltraps>

001022aa <vector157>:
.globl vector157
vector157:
  pushl $0
  1022aa:	6a 00                	push   $0x0
  pushl $157
  1022ac:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1022b1:	e9 98 04 00 00       	jmp    10274e <__alltraps>

001022b6 <vector158>:
.globl vector158
vector158:
  pushl $0
  1022b6:	6a 00                	push   $0x0
  pushl $158
  1022b8:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022bd:	e9 8c 04 00 00       	jmp    10274e <__alltraps>

001022c2 <vector159>:
.globl vector159
vector159:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $159
  1022c4:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1022c9:	e9 80 04 00 00       	jmp    10274e <__alltraps>

001022ce <vector160>:
.globl vector160
vector160:
  pushl $0
  1022ce:	6a 00                	push   $0x0
  pushl $160
  1022d0:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1022d5:	e9 74 04 00 00       	jmp    10274e <__alltraps>

001022da <vector161>:
.globl vector161
vector161:
  pushl $0
  1022da:	6a 00                	push   $0x0
  pushl $161
  1022dc:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1022e1:	e9 68 04 00 00       	jmp    10274e <__alltraps>

001022e6 <vector162>:
.globl vector162
vector162:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $162
  1022e8:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1022ed:	e9 5c 04 00 00       	jmp    10274e <__alltraps>

001022f2 <vector163>:
.globl vector163
vector163:
  pushl $0
  1022f2:	6a 00                	push   $0x0
  pushl $163
  1022f4:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1022f9:	e9 50 04 00 00       	jmp    10274e <__alltraps>

001022fe <vector164>:
.globl vector164
vector164:
  pushl $0
  1022fe:	6a 00                	push   $0x0
  pushl $164
  102300:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102305:	e9 44 04 00 00       	jmp    10274e <__alltraps>

0010230a <vector165>:
.globl vector165
vector165:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $165
  10230c:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102311:	e9 38 04 00 00       	jmp    10274e <__alltraps>

00102316 <vector166>:
.globl vector166
vector166:
  pushl $0
  102316:	6a 00                	push   $0x0
  pushl $166
  102318:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10231d:	e9 2c 04 00 00       	jmp    10274e <__alltraps>

00102322 <vector167>:
.globl vector167
vector167:
  pushl $0
  102322:	6a 00                	push   $0x0
  pushl $167
  102324:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102329:	e9 20 04 00 00       	jmp    10274e <__alltraps>

0010232e <vector168>:
.globl vector168
vector168:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $168
  102330:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102335:	e9 14 04 00 00       	jmp    10274e <__alltraps>

0010233a <vector169>:
.globl vector169
vector169:
  pushl $0
  10233a:	6a 00                	push   $0x0
  pushl $169
  10233c:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102341:	e9 08 04 00 00       	jmp    10274e <__alltraps>

00102346 <vector170>:
.globl vector170
vector170:
  pushl $0
  102346:	6a 00                	push   $0x0
  pushl $170
  102348:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10234d:	e9 fc 03 00 00       	jmp    10274e <__alltraps>

00102352 <vector171>:
.globl vector171
vector171:
  pushl $0
  102352:	6a 00                	push   $0x0
  pushl $171
  102354:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102359:	e9 f0 03 00 00       	jmp    10274e <__alltraps>

0010235e <vector172>:
.globl vector172
vector172:
  pushl $0
  10235e:	6a 00                	push   $0x0
  pushl $172
  102360:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102365:	e9 e4 03 00 00       	jmp    10274e <__alltraps>

0010236a <vector173>:
.globl vector173
vector173:
  pushl $0
  10236a:	6a 00                	push   $0x0
  pushl $173
  10236c:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102371:	e9 d8 03 00 00       	jmp    10274e <__alltraps>

00102376 <vector174>:
.globl vector174
vector174:
  pushl $0
  102376:	6a 00                	push   $0x0
  pushl $174
  102378:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10237d:	e9 cc 03 00 00       	jmp    10274e <__alltraps>

00102382 <vector175>:
.globl vector175
vector175:
  pushl $0
  102382:	6a 00                	push   $0x0
  pushl $175
  102384:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102389:	e9 c0 03 00 00       	jmp    10274e <__alltraps>

0010238e <vector176>:
.globl vector176
vector176:
  pushl $0
  10238e:	6a 00                	push   $0x0
  pushl $176
  102390:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102395:	e9 b4 03 00 00       	jmp    10274e <__alltraps>

0010239a <vector177>:
.globl vector177
vector177:
  pushl $0
  10239a:	6a 00                	push   $0x0
  pushl $177
  10239c:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1023a1:	e9 a8 03 00 00       	jmp    10274e <__alltraps>

001023a6 <vector178>:
.globl vector178
vector178:
  pushl $0
  1023a6:	6a 00                	push   $0x0
  pushl $178
  1023a8:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1023ad:	e9 9c 03 00 00       	jmp    10274e <__alltraps>

001023b2 <vector179>:
.globl vector179
vector179:
  pushl $0
  1023b2:	6a 00                	push   $0x0
  pushl $179
  1023b4:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023b9:	e9 90 03 00 00       	jmp    10274e <__alltraps>

001023be <vector180>:
.globl vector180
vector180:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $180
  1023c0:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023c5:	e9 84 03 00 00       	jmp    10274e <__alltraps>

001023ca <vector181>:
.globl vector181
vector181:
  pushl $0
  1023ca:	6a 00                	push   $0x0
  pushl $181
  1023cc:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1023d1:	e9 78 03 00 00       	jmp    10274e <__alltraps>

001023d6 <vector182>:
.globl vector182
vector182:
  pushl $0
  1023d6:	6a 00                	push   $0x0
  pushl $182
  1023d8:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1023dd:	e9 6c 03 00 00       	jmp    10274e <__alltraps>

001023e2 <vector183>:
.globl vector183
vector183:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $183
  1023e4:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1023e9:	e9 60 03 00 00       	jmp    10274e <__alltraps>

001023ee <vector184>:
.globl vector184
vector184:
  pushl $0
  1023ee:	6a 00                	push   $0x0
  pushl $184
  1023f0:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1023f5:	e9 54 03 00 00       	jmp    10274e <__alltraps>

001023fa <vector185>:
.globl vector185
vector185:
  pushl $0
  1023fa:	6a 00                	push   $0x0
  pushl $185
  1023fc:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102401:	e9 48 03 00 00       	jmp    10274e <__alltraps>

00102406 <vector186>:
.globl vector186
vector186:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $186
  102408:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10240d:	e9 3c 03 00 00       	jmp    10274e <__alltraps>

00102412 <vector187>:
.globl vector187
vector187:
  pushl $0
  102412:	6a 00                	push   $0x0
  pushl $187
  102414:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102419:	e9 30 03 00 00       	jmp    10274e <__alltraps>

0010241e <vector188>:
.globl vector188
vector188:
  pushl $0
  10241e:	6a 00                	push   $0x0
  pushl $188
  102420:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102425:	e9 24 03 00 00       	jmp    10274e <__alltraps>

0010242a <vector189>:
.globl vector189
vector189:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $189
  10242c:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102431:	e9 18 03 00 00       	jmp    10274e <__alltraps>

00102436 <vector190>:
.globl vector190
vector190:
  pushl $0
  102436:	6a 00                	push   $0x0
  pushl $190
  102438:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10243d:	e9 0c 03 00 00       	jmp    10274e <__alltraps>

00102442 <vector191>:
.globl vector191
vector191:
  pushl $0
  102442:	6a 00                	push   $0x0
  pushl $191
  102444:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102449:	e9 00 03 00 00       	jmp    10274e <__alltraps>

0010244e <vector192>:
.globl vector192
vector192:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $192
  102450:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102455:	e9 f4 02 00 00       	jmp    10274e <__alltraps>

0010245a <vector193>:
.globl vector193
vector193:
  pushl $0
  10245a:	6a 00                	push   $0x0
  pushl $193
  10245c:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102461:	e9 e8 02 00 00       	jmp    10274e <__alltraps>

00102466 <vector194>:
.globl vector194
vector194:
  pushl $0
  102466:	6a 00                	push   $0x0
  pushl $194
  102468:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10246d:	e9 dc 02 00 00       	jmp    10274e <__alltraps>

00102472 <vector195>:
.globl vector195
vector195:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $195
  102474:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102479:	e9 d0 02 00 00       	jmp    10274e <__alltraps>

0010247e <vector196>:
.globl vector196
vector196:
  pushl $0
  10247e:	6a 00                	push   $0x0
  pushl $196
  102480:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102485:	e9 c4 02 00 00       	jmp    10274e <__alltraps>

0010248a <vector197>:
.globl vector197
vector197:
  pushl $0
  10248a:	6a 00                	push   $0x0
  pushl $197
  10248c:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102491:	e9 b8 02 00 00       	jmp    10274e <__alltraps>

00102496 <vector198>:
.globl vector198
vector198:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $198
  102498:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10249d:	e9 ac 02 00 00       	jmp    10274e <__alltraps>

001024a2 <vector199>:
.globl vector199
vector199:
  pushl $0
  1024a2:	6a 00                	push   $0x0
  pushl $199
  1024a4:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1024a9:	e9 a0 02 00 00       	jmp    10274e <__alltraps>

001024ae <vector200>:
.globl vector200
vector200:
  pushl $0
  1024ae:	6a 00                	push   $0x0
  pushl $200
  1024b0:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024b5:	e9 94 02 00 00       	jmp    10274e <__alltraps>

001024ba <vector201>:
.globl vector201
vector201:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $201
  1024bc:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024c1:	e9 88 02 00 00       	jmp    10274e <__alltraps>

001024c6 <vector202>:
.globl vector202
vector202:
  pushl $0
  1024c6:	6a 00                	push   $0x0
  pushl $202
  1024c8:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1024cd:	e9 7c 02 00 00       	jmp    10274e <__alltraps>

001024d2 <vector203>:
.globl vector203
vector203:
  pushl $0
  1024d2:	6a 00                	push   $0x0
  pushl $203
  1024d4:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1024d9:	e9 70 02 00 00       	jmp    10274e <__alltraps>

001024de <vector204>:
.globl vector204
vector204:
  pushl $0
  1024de:	6a 00                	push   $0x0
  pushl $204
  1024e0:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1024e5:	e9 64 02 00 00       	jmp    10274e <__alltraps>

001024ea <vector205>:
.globl vector205
vector205:
  pushl $0
  1024ea:	6a 00                	push   $0x0
  pushl $205
  1024ec:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1024f1:	e9 58 02 00 00       	jmp    10274e <__alltraps>

001024f6 <vector206>:
.globl vector206
vector206:
  pushl $0
  1024f6:	6a 00                	push   $0x0
  pushl $206
  1024f8:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1024fd:	e9 4c 02 00 00       	jmp    10274e <__alltraps>

00102502 <vector207>:
.globl vector207
vector207:
  pushl $0
  102502:	6a 00                	push   $0x0
  pushl $207
  102504:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102509:	e9 40 02 00 00       	jmp    10274e <__alltraps>

0010250e <vector208>:
.globl vector208
vector208:
  pushl $0
  10250e:	6a 00                	push   $0x0
  pushl $208
  102510:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102515:	e9 34 02 00 00       	jmp    10274e <__alltraps>

0010251a <vector209>:
.globl vector209
vector209:
  pushl $0
  10251a:	6a 00                	push   $0x0
  pushl $209
  10251c:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102521:	e9 28 02 00 00       	jmp    10274e <__alltraps>

00102526 <vector210>:
.globl vector210
vector210:
  pushl $0
  102526:	6a 00                	push   $0x0
  pushl $210
  102528:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10252d:	e9 1c 02 00 00       	jmp    10274e <__alltraps>

00102532 <vector211>:
.globl vector211
vector211:
  pushl $0
  102532:	6a 00                	push   $0x0
  pushl $211
  102534:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102539:	e9 10 02 00 00       	jmp    10274e <__alltraps>

0010253e <vector212>:
.globl vector212
vector212:
  pushl $0
  10253e:	6a 00                	push   $0x0
  pushl $212
  102540:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102545:	e9 04 02 00 00       	jmp    10274e <__alltraps>

0010254a <vector213>:
.globl vector213
vector213:
  pushl $0
  10254a:	6a 00                	push   $0x0
  pushl $213
  10254c:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102551:	e9 f8 01 00 00       	jmp    10274e <__alltraps>

00102556 <vector214>:
.globl vector214
vector214:
  pushl $0
  102556:	6a 00                	push   $0x0
  pushl $214
  102558:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10255d:	e9 ec 01 00 00       	jmp    10274e <__alltraps>

00102562 <vector215>:
.globl vector215
vector215:
  pushl $0
  102562:	6a 00                	push   $0x0
  pushl $215
  102564:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102569:	e9 e0 01 00 00       	jmp    10274e <__alltraps>

0010256e <vector216>:
.globl vector216
vector216:
  pushl $0
  10256e:	6a 00                	push   $0x0
  pushl $216
  102570:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102575:	e9 d4 01 00 00       	jmp    10274e <__alltraps>

0010257a <vector217>:
.globl vector217
vector217:
  pushl $0
  10257a:	6a 00                	push   $0x0
  pushl $217
  10257c:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102581:	e9 c8 01 00 00       	jmp    10274e <__alltraps>

00102586 <vector218>:
.globl vector218
vector218:
  pushl $0
  102586:	6a 00                	push   $0x0
  pushl $218
  102588:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10258d:	e9 bc 01 00 00       	jmp    10274e <__alltraps>

00102592 <vector219>:
.globl vector219
vector219:
  pushl $0
  102592:	6a 00                	push   $0x0
  pushl $219
  102594:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102599:	e9 b0 01 00 00       	jmp    10274e <__alltraps>

0010259e <vector220>:
.globl vector220
vector220:
  pushl $0
  10259e:	6a 00                	push   $0x0
  pushl $220
  1025a0:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1025a5:	e9 a4 01 00 00       	jmp    10274e <__alltraps>

001025aa <vector221>:
.globl vector221
vector221:
  pushl $0
  1025aa:	6a 00                	push   $0x0
  pushl $221
  1025ac:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1025b1:	e9 98 01 00 00       	jmp    10274e <__alltraps>

001025b6 <vector222>:
.globl vector222
vector222:
  pushl $0
  1025b6:	6a 00                	push   $0x0
  pushl $222
  1025b8:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025bd:	e9 8c 01 00 00       	jmp    10274e <__alltraps>

001025c2 <vector223>:
.globl vector223
vector223:
  pushl $0
  1025c2:	6a 00                	push   $0x0
  pushl $223
  1025c4:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1025c9:	e9 80 01 00 00       	jmp    10274e <__alltraps>

001025ce <vector224>:
.globl vector224
vector224:
  pushl $0
  1025ce:	6a 00                	push   $0x0
  pushl $224
  1025d0:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1025d5:	e9 74 01 00 00       	jmp    10274e <__alltraps>

001025da <vector225>:
.globl vector225
vector225:
  pushl $0
  1025da:	6a 00                	push   $0x0
  pushl $225
  1025dc:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1025e1:	e9 68 01 00 00       	jmp    10274e <__alltraps>

001025e6 <vector226>:
.globl vector226
vector226:
  pushl $0
  1025e6:	6a 00                	push   $0x0
  pushl $226
  1025e8:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1025ed:	e9 5c 01 00 00       	jmp    10274e <__alltraps>

001025f2 <vector227>:
.globl vector227
vector227:
  pushl $0
  1025f2:	6a 00                	push   $0x0
  pushl $227
  1025f4:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1025f9:	e9 50 01 00 00       	jmp    10274e <__alltraps>

001025fe <vector228>:
.globl vector228
vector228:
  pushl $0
  1025fe:	6a 00                	push   $0x0
  pushl $228
  102600:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102605:	e9 44 01 00 00       	jmp    10274e <__alltraps>

0010260a <vector229>:
.globl vector229
vector229:
  pushl $0
  10260a:	6a 00                	push   $0x0
  pushl $229
  10260c:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102611:	e9 38 01 00 00       	jmp    10274e <__alltraps>

00102616 <vector230>:
.globl vector230
vector230:
  pushl $0
  102616:	6a 00                	push   $0x0
  pushl $230
  102618:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10261d:	e9 2c 01 00 00       	jmp    10274e <__alltraps>

00102622 <vector231>:
.globl vector231
vector231:
  pushl $0
  102622:	6a 00                	push   $0x0
  pushl $231
  102624:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102629:	e9 20 01 00 00       	jmp    10274e <__alltraps>

0010262e <vector232>:
.globl vector232
vector232:
  pushl $0
  10262e:	6a 00                	push   $0x0
  pushl $232
  102630:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102635:	e9 14 01 00 00       	jmp    10274e <__alltraps>

0010263a <vector233>:
.globl vector233
vector233:
  pushl $0
  10263a:	6a 00                	push   $0x0
  pushl $233
  10263c:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102641:	e9 08 01 00 00       	jmp    10274e <__alltraps>

00102646 <vector234>:
.globl vector234
vector234:
  pushl $0
  102646:	6a 00                	push   $0x0
  pushl $234
  102648:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10264d:	e9 fc 00 00 00       	jmp    10274e <__alltraps>

00102652 <vector235>:
.globl vector235
vector235:
  pushl $0
  102652:	6a 00                	push   $0x0
  pushl $235
  102654:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102659:	e9 f0 00 00 00       	jmp    10274e <__alltraps>

0010265e <vector236>:
.globl vector236
vector236:
  pushl $0
  10265e:	6a 00                	push   $0x0
  pushl $236
  102660:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102665:	e9 e4 00 00 00       	jmp    10274e <__alltraps>

0010266a <vector237>:
.globl vector237
vector237:
  pushl $0
  10266a:	6a 00                	push   $0x0
  pushl $237
  10266c:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102671:	e9 d8 00 00 00       	jmp    10274e <__alltraps>

00102676 <vector238>:
.globl vector238
vector238:
  pushl $0
  102676:	6a 00                	push   $0x0
  pushl $238
  102678:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10267d:	e9 cc 00 00 00       	jmp    10274e <__alltraps>

00102682 <vector239>:
.globl vector239
vector239:
  pushl $0
  102682:	6a 00                	push   $0x0
  pushl $239
  102684:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102689:	e9 c0 00 00 00       	jmp    10274e <__alltraps>

0010268e <vector240>:
.globl vector240
vector240:
  pushl $0
  10268e:	6a 00                	push   $0x0
  pushl $240
  102690:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102695:	e9 b4 00 00 00       	jmp    10274e <__alltraps>

0010269a <vector241>:
.globl vector241
vector241:
  pushl $0
  10269a:	6a 00                	push   $0x0
  pushl $241
  10269c:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1026a1:	e9 a8 00 00 00       	jmp    10274e <__alltraps>

001026a6 <vector242>:
.globl vector242
vector242:
  pushl $0
  1026a6:	6a 00                	push   $0x0
  pushl $242
  1026a8:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1026ad:	e9 9c 00 00 00       	jmp    10274e <__alltraps>

001026b2 <vector243>:
.globl vector243
vector243:
  pushl $0
  1026b2:	6a 00                	push   $0x0
  pushl $243
  1026b4:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026b9:	e9 90 00 00 00       	jmp    10274e <__alltraps>

001026be <vector244>:
.globl vector244
vector244:
  pushl $0
  1026be:	6a 00                	push   $0x0
  pushl $244
  1026c0:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026c5:	e9 84 00 00 00       	jmp    10274e <__alltraps>

001026ca <vector245>:
.globl vector245
vector245:
  pushl $0
  1026ca:	6a 00                	push   $0x0
  pushl $245
  1026cc:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1026d1:	e9 78 00 00 00       	jmp    10274e <__alltraps>

001026d6 <vector246>:
.globl vector246
vector246:
  pushl $0
  1026d6:	6a 00                	push   $0x0
  pushl $246
  1026d8:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1026dd:	e9 6c 00 00 00       	jmp    10274e <__alltraps>

001026e2 <vector247>:
.globl vector247
vector247:
  pushl $0
  1026e2:	6a 00                	push   $0x0
  pushl $247
  1026e4:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1026e9:	e9 60 00 00 00       	jmp    10274e <__alltraps>

001026ee <vector248>:
.globl vector248
vector248:
  pushl $0
  1026ee:	6a 00                	push   $0x0
  pushl $248
  1026f0:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1026f5:	e9 54 00 00 00       	jmp    10274e <__alltraps>

001026fa <vector249>:
.globl vector249
vector249:
  pushl $0
  1026fa:	6a 00                	push   $0x0
  pushl $249
  1026fc:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102701:	e9 48 00 00 00       	jmp    10274e <__alltraps>

00102706 <vector250>:
.globl vector250
vector250:
  pushl $0
  102706:	6a 00                	push   $0x0
  pushl $250
  102708:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10270d:	e9 3c 00 00 00       	jmp    10274e <__alltraps>

00102712 <vector251>:
.globl vector251
vector251:
  pushl $0
  102712:	6a 00                	push   $0x0
  pushl $251
  102714:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102719:	e9 30 00 00 00       	jmp    10274e <__alltraps>

0010271e <vector252>:
.globl vector252
vector252:
  pushl $0
  10271e:	6a 00                	push   $0x0
  pushl $252
  102720:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102725:	e9 24 00 00 00       	jmp    10274e <__alltraps>

0010272a <vector253>:
.globl vector253
vector253:
  pushl $0
  10272a:	6a 00                	push   $0x0
  pushl $253
  10272c:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102731:	e9 18 00 00 00       	jmp    10274e <__alltraps>

00102736 <vector254>:
.globl vector254
vector254:
  pushl $0
  102736:	6a 00                	push   $0x0
  pushl $254
  102738:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10273d:	e9 0c 00 00 00       	jmp    10274e <__alltraps>

00102742 <vector255>:
.globl vector255
vector255:
  pushl $0
  102742:	6a 00                	push   $0x0
  pushl $255
  102744:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102749:	e9 00 00 00 00       	jmp    10274e <__alltraps>

0010274e <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10274e:	1e                   	push   %ds
    pushl %es
  10274f:	06                   	push   %es
    pushl %fs
  102750:	0f a0                	push   %fs
    pushl %gs
  102752:	0f a8                	push   %gs
    pushal
  102754:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102755:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10275a:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10275c:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10275e:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10275f:	e8 60 f5 ff ff       	call   101cc4 <trap>

    # pop the pushed stack pointer
    popl %esp
  102764:	5c                   	pop    %esp

00102765 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102765:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102766:	0f a9                	pop    %gs
    popl %fs
  102768:	0f a1                	pop    %fs
    popl %es
  10276a:	07                   	pop    %es
    popl %ds
  10276b:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10276c:	83 c4 08             	add    $0x8,%esp
    iret
  10276f:	cf                   	iret   

00102770 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102770:	55                   	push   %ebp
  102771:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102773:	8b 45 08             	mov    0x8(%ebp),%eax
  102776:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102779:	b8 23 00 00 00       	mov    $0x23,%eax
  10277e:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102780:	b8 23 00 00 00       	mov    $0x23,%eax
  102785:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102787:	b8 10 00 00 00       	mov    $0x10,%eax
  10278c:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10278e:	b8 10 00 00 00       	mov    $0x10,%eax
  102793:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102795:	b8 10 00 00 00       	mov    $0x10,%eax
  10279a:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10279c:	ea a3 27 10 00 08 00 	ljmp   $0x8,$0x1027a3
}
  1027a3:	90                   	nop
  1027a4:	5d                   	pop    %ebp
  1027a5:	c3                   	ret    

001027a6 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1027a6:	f3 0f 1e fb          	endbr32 
  1027aa:	55                   	push   %ebp
  1027ab:	89 e5                	mov    %esp,%ebp
  1027ad:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027b0:	b8 20 09 11 00       	mov    $0x110920,%eax
  1027b5:	05 00 04 00 00       	add    $0x400,%eax
  1027ba:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  1027bf:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  1027c6:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027c8:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  1027cf:	68 00 
  1027d1:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1027d6:	0f b7 c0             	movzwl %ax,%eax
  1027d9:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1027df:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1027e4:	c1 e8 10             	shr    $0x10,%eax
  1027e7:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1027ec:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1027f3:	24 f0                	and    $0xf0,%al
  1027f5:	0c 09                	or     $0x9,%al
  1027f7:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1027fc:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102803:	0c 10                	or     $0x10,%al
  102805:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  10280a:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102811:	24 9f                	and    $0x9f,%al
  102813:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102818:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10281f:	0c 80                	or     $0x80,%al
  102821:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102826:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10282d:	24 f0                	and    $0xf0,%al
  10282f:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102834:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10283b:	24 ef                	and    $0xef,%al
  10283d:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102842:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102849:	24 df                	and    $0xdf,%al
  10284b:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102850:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102857:	0c 40                	or     $0x40,%al
  102859:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10285e:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102865:	24 7f                	and    $0x7f,%al
  102867:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10286c:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102871:	c1 e8 18             	shr    $0x18,%eax
  102874:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102879:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102880:	24 ef                	and    $0xef,%al
  102882:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102887:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  10288e:	e8 dd fe ff ff       	call   102770 <lgdt>
  102893:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102899:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10289d:	0f 00 d8             	ltr    %ax
}
  1028a0:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  1028a1:	90                   	nop
  1028a2:	c9                   	leave  
  1028a3:	c3                   	ret    

001028a4 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1028a4:	f3 0f 1e fb          	endbr32 
  1028a8:	55                   	push   %ebp
  1028a9:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1028ab:	e8 f6 fe ff ff       	call   1027a6 <gdt_init>
}
  1028b0:	90                   	nop
  1028b1:	5d                   	pop    %ebp
  1028b2:	c3                   	ret    

001028b3 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1028b3:	f3 0f 1e fb          	endbr32 
  1028b7:	55                   	push   %ebp
  1028b8:	89 e5                	mov    %esp,%ebp
  1028ba:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1028c4:	eb 03                	jmp    1028c9 <strlen+0x16>
        cnt ++;
  1028c6:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  1028c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1028cc:	8d 50 01             	lea    0x1(%eax),%edx
  1028cf:	89 55 08             	mov    %edx,0x8(%ebp)
  1028d2:	0f b6 00             	movzbl (%eax),%eax
  1028d5:	84 c0                	test   %al,%al
  1028d7:	75 ed                	jne    1028c6 <strlen+0x13>
    }
    return cnt;
  1028d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1028dc:	c9                   	leave  
  1028dd:	c3                   	ret    

001028de <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1028de:	f3 0f 1e fb          	endbr32 
  1028e2:	55                   	push   %ebp
  1028e3:	89 e5                	mov    %esp,%ebp
  1028e5:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1028ef:	eb 03                	jmp    1028f4 <strnlen+0x16>
        cnt ++;
  1028f1:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1028f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028f7:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1028fa:	73 10                	jae    10290c <strnlen+0x2e>
  1028fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1028ff:	8d 50 01             	lea    0x1(%eax),%edx
  102902:	89 55 08             	mov    %edx,0x8(%ebp)
  102905:	0f b6 00             	movzbl (%eax),%eax
  102908:	84 c0                	test   %al,%al
  10290a:	75 e5                	jne    1028f1 <strnlen+0x13>
    }
    return cnt;
  10290c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10290f:	c9                   	leave  
  102910:	c3                   	ret    

00102911 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102911:	f3 0f 1e fb          	endbr32 
  102915:	55                   	push   %ebp
  102916:	89 e5                	mov    %esp,%ebp
  102918:	57                   	push   %edi
  102919:	56                   	push   %esi
  10291a:	83 ec 20             	sub    $0x20,%esp
  10291d:	8b 45 08             	mov    0x8(%ebp),%eax
  102920:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102923:	8b 45 0c             	mov    0xc(%ebp),%eax
  102926:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102929:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10292c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10292f:	89 d1                	mov    %edx,%ecx
  102931:	89 c2                	mov    %eax,%edx
  102933:	89 ce                	mov    %ecx,%esi
  102935:	89 d7                	mov    %edx,%edi
  102937:	ac                   	lods   %ds:(%esi),%al
  102938:	aa                   	stos   %al,%es:(%edi)
  102939:	84 c0                	test   %al,%al
  10293b:	75 fa                	jne    102937 <strcpy+0x26>
  10293d:	89 fa                	mov    %edi,%edx
  10293f:	89 f1                	mov    %esi,%ecx
  102941:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102944:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102947:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10294a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10294d:	83 c4 20             	add    $0x20,%esp
  102950:	5e                   	pop    %esi
  102951:	5f                   	pop    %edi
  102952:	5d                   	pop    %ebp
  102953:	c3                   	ret    

00102954 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102954:	f3 0f 1e fb          	endbr32 
  102958:	55                   	push   %ebp
  102959:	89 e5                	mov    %esp,%ebp
  10295b:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10295e:	8b 45 08             	mov    0x8(%ebp),%eax
  102961:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102964:	eb 1e                	jmp    102984 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102966:	8b 45 0c             	mov    0xc(%ebp),%eax
  102969:	0f b6 10             	movzbl (%eax),%edx
  10296c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10296f:	88 10                	mov    %dl,(%eax)
  102971:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102974:	0f b6 00             	movzbl (%eax),%eax
  102977:	84 c0                	test   %al,%al
  102979:	74 03                	je     10297e <strncpy+0x2a>
            src ++;
  10297b:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  10297e:	ff 45 fc             	incl   -0x4(%ebp)
  102981:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102984:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102988:	75 dc                	jne    102966 <strncpy+0x12>
    }
    return dst;
  10298a:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10298d:	c9                   	leave  
  10298e:	c3                   	ret    

0010298f <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10298f:	f3 0f 1e fb          	endbr32 
  102993:	55                   	push   %ebp
  102994:	89 e5                	mov    %esp,%ebp
  102996:	57                   	push   %edi
  102997:	56                   	push   %esi
  102998:	83 ec 20             	sub    $0x20,%esp
  10299b:	8b 45 08             	mov    0x8(%ebp),%eax
  10299e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1029a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1029a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1029aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1029ad:	89 d1                	mov    %edx,%ecx
  1029af:	89 c2                	mov    %eax,%edx
  1029b1:	89 ce                	mov    %ecx,%esi
  1029b3:	89 d7                	mov    %edx,%edi
  1029b5:	ac                   	lods   %ds:(%esi),%al
  1029b6:	ae                   	scas   %es:(%edi),%al
  1029b7:	75 08                	jne    1029c1 <strcmp+0x32>
  1029b9:	84 c0                	test   %al,%al
  1029bb:	75 f8                	jne    1029b5 <strcmp+0x26>
  1029bd:	31 c0                	xor    %eax,%eax
  1029bf:	eb 04                	jmp    1029c5 <strcmp+0x36>
  1029c1:	19 c0                	sbb    %eax,%eax
  1029c3:	0c 01                	or     $0x1,%al
  1029c5:	89 fa                	mov    %edi,%edx
  1029c7:	89 f1                	mov    %esi,%ecx
  1029c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1029cc:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1029cf:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1029d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1029d5:	83 c4 20             	add    $0x20,%esp
  1029d8:	5e                   	pop    %esi
  1029d9:	5f                   	pop    %edi
  1029da:	5d                   	pop    %ebp
  1029db:	c3                   	ret    

001029dc <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1029dc:	f3 0f 1e fb          	endbr32 
  1029e0:	55                   	push   %ebp
  1029e1:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029e3:	eb 09                	jmp    1029ee <strncmp+0x12>
        n --, s1 ++, s2 ++;
  1029e5:	ff 4d 10             	decl   0x10(%ebp)
  1029e8:	ff 45 08             	incl   0x8(%ebp)
  1029eb:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029ee:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029f2:	74 1a                	je     102a0e <strncmp+0x32>
  1029f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f7:	0f b6 00             	movzbl (%eax),%eax
  1029fa:	84 c0                	test   %al,%al
  1029fc:	74 10                	je     102a0e <strncmp+0x32>
  1029fe:	8b 45 08             	mov    0x8(%ebp),%eax
  102a01:	0f b6 10             	movzbl (%eax),%edx
  102a04:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a07:	0f b6 00             	movzbl (%eax),%eax
  102a0a:	38 c2                	cmp    %al,%dl
  102a0c:	74 d7                	je     1029e5 <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102a0e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a12:	74 18                	je     102a2c <strncmp+0x50>
  102a14:	8b 45 08             	mov    0x8(%ebp),%eax
  102a17:	0f b6 00             	movzbl (%eax),%eax
  102a1a:	0f b6 d0             	movzbl %al,%edx
  102a1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a20:	0f b6 00             	movzbl (%eax),%eax
  102a23:	0f b6 c0             	movzbl %al,%eax
  102a26:	29 c2                	sub    %eax,%edx
  102a28:	89 d0                	mov    %edx,%eax
  102a2a:	eb 05                	jmp    102a31 <strncmp+0x55>
  102a2c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a31:	5d                   	pop    %ebp
  102a32:	c3                   	ret    

00102a33 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102a33:	f3 0f 1e fb          	endbr32 
  102a37:	55                   	push   %ebp
  102a38:	89 e5                	mov    %esp,%ebp
  102a3a:	83 ec 04             	sub    $0x4,%esp
  102a3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a40:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a43:	eb 13                	jmp    102a58 <strchr+0x25>
        if (*s == c) {
  102a45:	8b 45 08             	mov    0x8(%ebp),%eax
  102a48:	0f b6 00             	movzbl (%eax),%eax
  102a4b:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102a4e:	75 05                	jne    102a55 <strchr+0x22>
            return (char *)s;
  102a50:	8b 45 08             	mov    0x8(%ebp),%eax
  102a53:	eb 12                	jmp    102a67 <strchr+0x34>
        }
        s ++;
  102a55:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102a58:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5b:	0f b6 00             	movzbl (%eax),%eax
  102a5e:	84 c0                	test   %al,%al
  102a60:	75 e3                	jne    102a45 <strchr+0x12>
    }
    return NULL;
  102a62:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a67:	c9                   	leave  
  102a68:	c3                   	ret    

00102a69 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102a69:	f3 0f 1e fb          	endbr32 
  102a6d:	55                   	push   %ebp
  102a6e:	89 e5                	mov    %esp,%ebp
  102a70:	83 ec 04             	sub    $0x4,%esp
  102a73:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a76:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a79:	eb 0e                	jmp    102a89 <strfind+0x20>
        if (*s == c) {
  102a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7e:	0f b6 00             	movzbl (%eax),%eax
  102a81:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102a84:	74 0f                	je     102a95 <strfind+0x2c>
            break;
        }
        s ++;
  102a86:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102a89:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8c:	0f b6 00             	movzbl (%eax),%eax
  102a8f:	84 c0                	test   %al,%al
  102a91:	75 e8                	jne    102a7b <strfind+0x12>
  102a93:	eb 01                	jmp    102a96 <strfind+0x2d>
            break;
  102a95:	90                   	nop
    }
    return (char *)s;
  102a96:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102a99:	c9                   	leave  
  102a9a:	c3                   	ret    

00102a9b <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102a9b:	f3 0f 1e fb          	endbr32 
  102a9f:	55                   	push   %ebp
  102aa0:	89 e5                	mov    %esp,%ebp
  102aa2:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102aa5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102aac:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102ab3:	eb 03                	jmp    102ab8 <strtol+0x1d>
        s ++;
  102ab5:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  102abb:	0f b6 00             	movzbl (%eax),%eax
  102abe:	3c 20                	cmp    $0x20,%al
  102ac0:	74 f3                	je     102ab5 <strtol+0x1a>
  102ac2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac5:	0f b6 00             	movzbl (%eax),%eax
  102ac8:	3c 09                	cmp    $0x9,%al
  102aca:	74 e9                	je     102ab5 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102acc:	8b 45 08             	mov    0x8(%ebp),%eax
  102acf:	0f b6 00             	movzbl (%eax),%eax
  102ad2:	3c 2b                	cmp    $0x2b,%al
  102ad4:	75 05                	jne    102adb <strtol+0x40>
        s ++;
  102ad6:	ff 45 08             	incl   0x8(%ebp)
  102ad9:	eb 14                	jmp    102aef <strtol+0x54>
    }
    else if (*s == '-') {
  102adb:	8b 45 08             	mov    0x8(%ebp),%eax
  102ade:	0f b6 00             	movzbl (%eax),%eax
  102ae1:	3c 2d                	cmp    $0x2d,%al
  102ae3:	75 0a                	jne    102aef <strtol+0x54>
        s ++, neg = 1;
  102ae5:	ff 45 08             	incl   0x8(%ebp)
  102ae8:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102aef:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102af3:	74 06                	je     102afb <strtol+0x60>
  102af5:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102af9:	75 22                	jne    102b1d <strtol+0x82>
  102afb:	8b 45 08             	mov    0x8(%ebp),%eax
  102afe:	0f b6 00             	movzbl (%eax),%eax
  102b01:	3c 30                	cmp    $0x30,%al
  102b03:	75 18                	jne    102b1d <strtol+0x82>
  102b05:	8b 45 08             	mov    0x8(%ebp),%eax
  102b08:	40                   	inc    %eax
  102b09:	0f b6 00             	movzbl (%eax),%eax
  102b0c:	3c 78                	cmp    $0x78,%al
  102b0e:	75 0d                	jne    102b1d <strtol+0x82>
        s += 2, base = 16;
  102b10:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102b14:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102b1b:	eb 29                	jmp    102b46 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102b1d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b21:	75 16                	jne    102b39 <strtol+0x9e>
  102b23:	8b 45 08             	mov    0x8(%ebp),%eax
  102b26:	0f b6 00             	movzbl (%eax),%eax
  102b29:	3c 30                	cmp    $0x30,%al
  102b2b:	75 0c                	jne    102b39 <strtol+0x9e>
        s ++, base = 8;
  102b2d:	ff 45 08             	incl   0x8(%ebp)
  102b30:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102b37:	eb 0d                	jmp    102b46 <strtol+0xab>
    }
    else if (base == 0) {
  102b39:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b3d:	75 07                	jne    102b46 <strtol+0xab>
        base = 10;
  102b3f:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102b46:	8b 45 08             	mov    0x8(%ebp),%eax
  102b49:	0f b6 00             	movzbl (%eax),%eax
  102b4c:	3c 2f                	cmp    $0x2f,%al
  102b4e:	7e 1b                	jle    102b6b <strtol+0xd0>
  102b50:	8b 45 08             	mov    0x8(%ebp),%eax
  102b53:	0f b6 00             	movzbl (%eax),%eax
  102b56:	3c 39                	cmp    $0x39,%al
  102b58:	7f 11                	jg     102b6b <strtol+0xd0>
            dig = *s - '0';
  102b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b5d:	0f b6 00             	movzbl (%eax),%eax
  102b60:	0f be c0             	movsbl %al,%eax
  102b63:	83 e8 30             	sub    $0x30,%eax
  102b66:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b69:	eb 48                	jmp    102bb3 <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102b6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6e:	0f b6 00             	movzbl (%eax),%eax
  102b71:	3c 60                	cmp    $0x60,%al
  102b73:	7e 1b                	jle    102b90 <strtol+0xf5>
  102b75:	8b 45 08             	mov    0x8(%ebp),%eax
  102b78:	0f b6 00             	movzbl (%eax),%eax
  102b7b:	3c 7a                	cmp    $0x7a,%al
  102b7d:	7f 11                	jg     102b90 <strtol+0xf5>
            dig = *s - 'a' + 10;
  102b7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b82:	0f b6 00             	movzbl (%eax),%eax
  102b85:	0f be c0             	movsbl %al,%eax
  102b88:	83 e8 57             	sub    $0x57,%eax
  102b8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b8e:	eb 23                	jmp    102bb3 <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102b90:	8b 45 08             	mov    0x8(%ebp),%eax
  102b93:	0f b6 00             	movzbl (%eax),%eax
  102b96:	3c 40                	cmp    $0x40,%al
  102b98:	7e 3b                	jle    102bd5 <strtol+0x13a>
  102b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9d:	0f b6 00             	movzbl (%eax),%eax
  102ba0:	3c 5a                	cmp    $0x5a,%al
  102ba2:	7f 31                	jg     102bd5 <strtol+0x13a>
            dig = *s - 'A' + 10;
  102ba4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba7:	0f b6 00             	movzbl (%eax),%eax
  102baa:	0f be c0             	movsbl %al,%eax
  102bad:	83 e8 37             	sub    $0x37,%eax
  102bb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bb6:	3b 45 10             	cmp    0x10(%ebp),%eax
  102bb9:	7d 19                	jge    102bd4 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102bbb:	ff 45 08             	incl   0x8(%ebp)
  102bbe:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bc1:	0f af 45 10          	imul   0x10(%ebp),%eax
  102bc5:	89 c2                	mov    %eax,%edx
  102bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bca:	01 d0                	add    %edx,%eax
  102bcc:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102bcf:	e9 72 ff ff ff       	jmp    102b46 <strtol+0xab>
            break;
  102bd4:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102bd5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bd9:	74 08                	je     102be3 <strtol+0x148>
        *endptr = (char *) s;
  102bdb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bde:	8b 55 08             	mov    0x8(%ebp),%edx
  102be1:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102be3:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102be7:	74 07                	je     102bf0 <strtol+0x155>
  102be9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bec:	f7 d8                	neg    %eax
  102bee:	eb 03                	jmp    102bf3 <strtol+0x158>
  102bf0:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102bf3:	c9                   	leave  
  102bf4:	c3                   	ret    

00102bf5 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102bf5:	f3 0f 1e fb          	endbr32 
  102bf9:	55                   	push   %ebp
  102bfa:	89 e5                	mov    %esp,%ebp
  102bfc:	57                   	push   %edi
  102bfd:	83 ec 24             	sub    $0x24,%esp
  102c00:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c03:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102c06:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102c10:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102c13:	8b 45 10             	mov    0x10(%ebp),%eax
  102c16:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102c19:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102c1c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102c20:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102c23:	89 d7                	mov    %edx,%edi
  102c25:	f3 aa                	rep stos %al,%es:(%edi)
  102c27:	89 fa                	mov    %edi,%edx
  102c29:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102c2c:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102c2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102c32:	83 c4 24             	add    $0x24,%esp
  102c35:	5f                   	pop    %edi
  102c36:	5d                   	pop    %ebp
  102c37:	c3                   	ret    

00102c38 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102c38:	f3 0f 1e fb          	endbr32 
  102c3c:	55                   	push   %ebp
  102c3d:	89 e5                	mov    %esp,%ebp
  102c3f:	57                   	push   %edi
  102c40:	56                   	push   %esi
  102c41:	53                   	push   %ebx
  102c42:	83 ec 30             	sub    $0x30,%esp
  102c45:	8b 45 08             	mov    0x8(%ebp),%eax
  102c48:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c51:	8b 45 10             	mov    0x10(%ebp),%eax
  102c54:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102c57:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c5a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102c5d:	73 42                	jae    102ca1 <memmove+0x69>
  102c5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c65:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c68:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c6b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c6e:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102c71:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102c74:	c1 e8 02             	shr    $0x2,%eax
  102c77:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102c79:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102c7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c7f:	89 d7                	mov    %edx,%edi
  102c81:	89 c6                	mov    %eax,%esi
  102c83:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102c85:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102c88:	83 e1 03             	and    $0x3,%ecx
  102c8b:	74 02                	je     102c8f <memmove+0x57>
  102c8d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c8f:	89 f0                	mov    %esi,%eax
  102c91:	89 fa                	mov    %edi,%edx
  102c93:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102c96:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102c99:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102c9c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102c9f:	eb 36                	jmp    102cd7 <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102ca1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ca4:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ca7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102caa:	01 c2                	add    %eax,%edx
  102cac:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102caf:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102cb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cb5:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102cb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102cbb:	89 c1                	mov    %eax,%ecx
  102cbd:	89 d8                	mov    %ebx,%eax
  102cbf:	89 d6                	mov    %edx,%esi
  102cc1:	89 c7                	mov    %eax,%edi
  102cc3:	fd                   	std    
  102cc4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102cc6:	fc                   	cld    
  102cc7:	89 f8                	mov    %edi,%eax
  102cc9:	89 f2                	mov    %esi,%edx
  102ccb:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102cce:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102cd1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102cd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102cd7:	83 c4 30             	add    $0x30,%esp
  102cda:	5b                   	pop    %ebx
  102cdb:	5e                   	pop    %esi
  102cdc:	5f                   	pop    %edi
  102cdd:	5d                   	pop    %ebp
  102cde:	c3                   	ret    

00102cdf <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102cdf:	f3 0f 1e fb          	endbr32 
  102ce3:	55                   	push   %ebp
  102ce4:	89 e5                	mov    %esp,%ebp
  102ce6:	57                   	push   %edi
  102ce7:	56                   	push   %esi
  102ce8:	83 ec 20             	sub    $0x20,%esp
  102ceb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cf1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cf7:	8b 45 10             	mov    0x10(%ebp),%eax
  102cfa:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102cfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d00:	c1 e8 02             	shr    $0x2,%eax
  102d03:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102d05:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d0b:	89 d7                	mov    %edx,%edi
  102d0d:	89 c6                	mov    %eax,%esi
  102d0f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102d11:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102d14:	83 e1 03             	and    $0x3,%ecx
  102d17:	74 02                	je     102d1b <memcpy+0x3c>
  102d19:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102d1b:	89 f0                	mov    %esi,%eax
  102d1d:	89 fa                	mov    %edi,%edx
  102d1f:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102d22:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102d25:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102d2b:	83 c4 20             	add    $0x20,%esp
  102d2e:	5e                   	pop    %esi
  102d2f:	5f                   	pop    %edi
  102d30:	5d                   	pop    %ebp
  102d31:	c3                   	ret    

00102d32 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102d32:	f3 0f 1e fb          	endbr32 
  102d36:	55                   	push   %ebp
  102d37:	89 e5                	mov    %esp,%ebp
  102d39:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102d3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102d42:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d45:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102d48:	eb 2e                	jmp    102d78 <memcmp+0x46>
        if (*s1 != *s2) {
  102d4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d4d:	0f b6 10             	movzbl (%eax),%edx
  102d50:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d53:	0f b6 00             	movzbl (%eax),%eax
  102d56:	38 c2                	cmp    %al,%dl
  102d58:	74 18                	je     102d72 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d5d:	0f b6 00             	movzbl (%eax),%eax
  102d60:	0f b6 d0             	movzbl %al,%edx
  102d63:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d66:	0f b6 00             	movzbl (%eax),%eax
  102d69:	0f b6 c0             	movzbl %al,%eax
  102d6c:	29 c2                	sub    %eax,%edx
  102d6e:	89 d0                	mov    %edx,%eax
  102d70:	eb 18                	jmp    102d8a <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102d72:	ff 45 fc             	incl   -0x4(%ebp)
  102d75:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102d78:	8b 45 10             	mov    0x10(%ebp),%eax
  102d7b:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d7e:	89 55 10             	mov    %edx,0x10(%ebp)
  102d81:	85 c0                	test   %eax,%eax
  102d83:	75 c5                	jne    102d4a <memcmp+0x18>
    }
    return 0;
  102d85:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d8a:	c9                   	leave  
  102d8b:	c3                   	ret    

00102d8c <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102d8c:	f3 0f 1e fb          	endbr32 
  102d90:	55                   	push   %ebp
  102d91:	89 e5                	mov    %esp,%ebp
  102d93:	83 ec 58             	sub    $0x58,%esp
  102d96:	8b 45 10             	mov    0x10(%ebp),%eax
  102d99:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102d9c:	8b 45 14             	mov    0x14(%ebp),%eax
  102d9f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102da2:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102da5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102da8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102dab:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102dae:	8b 45 18             	mov    0x18(%ebp),%eax
  102db1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102db4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102db7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102dba:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102dbd:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102dc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dc6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102dca:	74 1c                	je     102de8 <printnum+0x5c>
  102dcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dcf:	ba 00 00 00 00       	mov    $0x0,%edx
  102dd4:	f7 75 e4             	divl   -0x1c(%ebp)
  102dd7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102dda:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ddd:	ba 00 00 00 00       	mov    $0x0,%edx
  102de2:	f7 75 e4             	divl   -0x1c(%ebp)
  102de5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102de8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102deb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102dee:	f7 75 e4             	divl   -0x1c(%ebp)
  102df1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102df4:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102df7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dfa:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102dfd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e00:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102e03:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e06:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102e09:	8b 45 18             	mov    0x18(%ebp),%eax
  102e0c:	ba 00 00 00 00       	mov    $0x0,%edx
  102e11:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102e14:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102e17:	19 d1                	sbb    %edx,%ecx
  102e19:	72 4c                	jb     102e67 <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102e1b:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102e1e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e21:	8b 45 20             	mov    0x20(%ebp),%eax
  102e24:	89 44 24 18          	mov    %eax,0x18(%esp)
  102e28:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e2c:	8b 45 18             	mov    0x18(%ebp),%eax
  102e2f:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e33:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e36:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102e39:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e3d:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e44:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e48:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4b:	89 04 24             	mov    %eax,(%esp)
  102e4e:	e8 39 ff ff ff       	call   102d8c <printnum>
  102e53:	eb 1b                	jmp    102e70 <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102e55:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e58:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e5c:	8b 45 20             	mov    0x20(%ebp),%eax
  102e5f:	89 04 24             	mov    %eax,(%esp)
  102e62:	8b 45 08             	mov    0x8(%ebp),%eax
  102e65:	ff d0                	call   *%eax
        while (-- width > 0)
  102e67:	ff 4d 1c             	decl   0x1c(%ebp)
  102e6a:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e6e:	7f e5                	jg     102e55 <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102e70:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102e73:	05 b0 3b 10 00       	add    $0x103bb0,%eax
  102e78:	0f b6 00             	movzbl (%eax),%eax
  102e7b:	0f be c0             	movsbl %al,%eax
  102e7e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e81:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e85:	89 04 24             	mov    %eax,(%esp)
  102e88:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8b:	ff d0                	call   *%eax
}
  102e8d:	90                   	nop
  102e8e:	c9                   	leave  
  102e8f:	c3                   	ret    

00102e90 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102e90:	f3 0f 1e fb          	endbr32 
  102e94:	55                   	push   %ebp
  102e95:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e97:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e9b:	7e 14                	jle    102eb1 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  102e9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea0:	8b 00                	mov    (%eax),%eax
  102ea2:	8d 48 08             	lea    0x8(%eax),%ecx
  102ea5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ea8:	89 0a                	mov    %ecx,(%edx)
  102eaa:	8b 50 04             	mov    0x4(%eax),%edx
  102ead:	8b 00                	mov    (%eax),%eax
  102eaf:	eb 30                	jmp    102ee1 <getuint+0x51>
    }
    else if (lflag) {
  102eb1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102eb5:	74 16                	je     102ecd <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  102eb7:	8b 45 08             	mov    0x8(%ebp),%eax
  102eba:	8b 00                	mov    (%eax),%eax
  102ebc:	8d 48 04             	lea    0x4(%eax),%ecx
  102ebf:	8b 55 08             	mov    0x8(%ebp),%edx
  102ec2:	89 0a                	mov    %ecx,(%edx)
  102ec4:	8b 00                	mov    (%eax),%eax
  102ec6:	ba 00 00 00 00       	mov    $0x0,%edx
  102ecb:	eb 14                	jmp    102ee1 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  102ecd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed0:	8b 00                	mov    (%eax),%eax
  102ed2:	8d 48 04             	lea    0x4(%eax),%ecx
  102ed5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ed8:	89 0a                	mov    %ecx,(%edx)
  102eda:	8b 00                	mov    (%eax),%eax
  102edc:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102ee1:	5d                   	pop    %ebp
  102ee2:	c3                   	ret    

00102ee3 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102ee3:	f3 0f 1e fb          	endbr32 
  102ee7:	55                   	push   %ebp
  102ee8:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102eea:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102eee:	7e 14                	jle    102f04 <getint+0x21>
        return va_arg(*ap, long long);
  102ef0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef3:	8b 00                	mov    (%eax),%eax
  102ef5:	8d 48 08             	lea    0x8(%eax),%ecx
  102ef8:	8b 55 08             	mov    0x8(%ebp),%edx
  102efb:	89 0a                	mov    %ecx,(%edx)
  102efd:	8b 50 04             	mov    0x4(%eax),%edx
  102f00:	8b 00                	mov    (%eax),%eax
  102f02:	eb 28                	jmp    102f2c <getint+0x49>
    }
    else if (lflag) {
  102f04:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f08:	74 12                	je     102f1c <getint+0x39>
        return va_arg(*ap, long);
  102f0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0d:	8b 00                	mov    (%eax),%eax
  102f0f:	8d 48 04             	lea    0x4(%eax),%ecx
  102f12:	8b 55 08             	mov    0x8(%ebp),%edx
  102f15:	89 0a                	mov    %ecx,(%edx)
  102f17:	8b 00                	mov    (%eax),%eax
  102f19:	99                   	cltd   
  102f1a:	eb 10                	jmp    102f2c <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  102f1c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1f:	8b 00                	mov    (%eax),%eax
  102f21:	8d 48 04             	lea    0x4(%eax),%ecx
  102f24:	8b 55 08             	mov    0x8(%ebp),%edx
  102f27:	89 0a                	mov    %ecx,(%edx)
  102f29:	8b 00                	mov    (%eax),%eax
  102f2b:	99                   	cltd   
    }
}
  102f2c:	5d                   	pop    %ebp
  102f2d:	c3                   	ret    

00102f2e <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102f2e:	f3 0f 1e fb          	endbr32 
  102f32:	55                   	push   %ebp
  102f33:	89 e5                	mov    %esp,%ebp
  102f35:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102f38:	8d 45 14             	lea    0x14(%ebp),%eax
  102f3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f41:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f45:	8b 45 10             	mov    0x10(%ebp),%eax
  102f48:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f4c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f53:	8b 45 08             	mov    0x8(%ebp),%eax
  102f56:	89 04 24             	mov    %eax,(%esp)
  102f59:	e8 03 00 00 00       	call   102f61 <vprintfmt>
    va_end(ap);
}
  102f5e:	90                   	nop
  102f5f:	c9                   	leave  
  102f60:	c3                   	ret    

00102f61 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102f61:	f3 0f 1e fb          	endbr32 
  102f65:	55                   	push   %ebp
  102f66:	89 e5                	mov    %esp,%ebp
  102f68:	56                   	push   %esi
  102f69:	53                   	push   %ebx
  102f6a:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f6d:	eb 17                	jmp    102f86 <vprintfmt+0x25>
            if (ch == '\0') {
  102f6f:	85 db                	test   %ebx,%ebx
  102f71:	0f 84 c0 03 00 00    	je     103337 <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  102f77:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f7e:	89 1c 24             	mov    %ebx,(%esp)
  102f81:	8b 45 08             	mov    0x8(%ebp),%eax
  102f84:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f86:	8b 45 10             	mov    0x10(%ebp),%eax
  102f89:	8d 50 01             	lea    0x1(%eax),%edx
  102f8c:	89 55 10             	mov    %edx,0x10(%ebp)
  102f8f:	0f b6 00             	movzbl (%eax),%eax
  102f92:	0f b6 d8             	movzbl %al,%ebx
  102f95:	83 fb 25             	cmp    $0x25,%ebx
  102f98:	75 d5                	jne    102f6f <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102f9a:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102f9e:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102fa5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102fa8:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102fab:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102fb2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fb5:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102fb8:	8b 45 10             	mov    0x10(%ebp),%eax
  102fbb:	8d 50 01             	lea    0x1(%eax),%edx
  102fbe:	89 55 10             	mov    %edx,0x10(%ebp)
  102fc1:	0f b6 00             	movzbl (%eax),%eax
  102fc4:	0f b6 d8             	movzbl %al,%ebx
  102fc7:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102fca:	83 f8 55             	cmp    $0x55,%eax
  102fcd:	0f 87 38 03 00 00    	ja     10330b <vprintfmt+0x3aa>
  102fd3:	8b 04 85 d4 3b 10 00 	mov    0x103bd4(,%eax,4),%eax
  102fda:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102fdd:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102fe1:	eb d5                	jmp    102fb8 <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102fe3:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102fe7:	eb cf                	jmp    102fb8 <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102fe9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102ff0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102ff3:	89 d0                	mov    %edx,%eax
  102ff5:	c1 e0 02             	shl    $0x2,%eax
  102ff8:	01 d0                	add    %edx,%eax
  102ffa:	01 c0                	add    %eax,%eax
  102ffc:	01 d8                	add    %ebx,%eax
  102ffe:	83 e8 30             	sub    $0x30,%eax
  103001:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  103004:	8b 45 10             	mov    0x10(%ebp),%eax
  103007:	0f b6 00             	movzbl (%eax),%eax
  10300a:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  10300d:	83 fb 2f             	cmp    $0x2f,%ebx
  103010:	7e 38                	jle    10304a <vprintfmt+0xe9>
  103012:	83 fb 39             	cmp    $0x39,%ebx
  103015:	7f 33                	jg     10304a <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  103017:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  10301a:	eb d4                	jmp    102ff0 <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10301c:	8b 45 14             	mov    0x14(%ebp),%eax
  10301f:	8d 50 04             	lea    0x4(%eax),%edx
  103022:	89 55 14             	mov    %edx,0x14(%ebp)
  103025:	8b 00                	mov    (%eax),%eax
  103027:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10302a:	eb 1f                	jmp    10304b <vprintfmt+0xea>

        case '.':
            if (width < 0)
  10302c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103030:	79 86                	jns    102fb8 <vprintfmt+0x57>
                width = 0;
  103032:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103039:	e9 7a ff ff ff       	jmp    102fb8 <vprintfmt+0x57>

        case '#':
            altflag = 1;
  10303e:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103045:	e9 6e ff ff ff       	jmp    102fb8 <vprintfmt+0x57>
            goto process_precision;
  10304a:	90                   	nop

        process_precision:
            if (width < 0)
  10304b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10304f:	0f 89 63 ff ff ff    	jns    102fb8 <vprintfmt+0x57>
                width = precision, precision = -1;
  103055:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103058:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10305b:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103062:	e9 51 ff ff ff       	jmp    102fb8 <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103067:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  10306a:	e9 49 ff ff ff       	jmp    102fb8 <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  10306f:	8b 45 14             	mov    0x14(%ebp),%eax
  103072:	8d 50 04             	lea    0x4(%eax),%edx
  103075:	89 55 14             	mov    %edx,0x14(%ebp)
  103078:	8b 00                	mov    (%eax),%eax
  10307a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10307d:	89 54 24 04          	mov    %edx,0x4(%esp)
  103081:	89 04 24             	mov    %eax,(%esp)
  103084:	8b 45 08             	mov    0x8(%ebp),%eax
  103087:	ff d0                	call   *%eax
            break;
  103089:	e9 a4 02 00 00       	jmp    103332 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  10308e:	8b 45 14             	mov    0x14(%ebp),%eax
  103091:	8d 50 04             	lea    0x4(%eax),%edx
  103094:	89 55 14             	mov    %edx,0x14(%ebp)
  103097:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103099:	85 db                	test   %ebx,%ebx
  10309b:	79 02                	jns    10309f <vprintfmt+0x13e>
                err = -err;
  10309d:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10309f:	83 fb 06             	cmp    $0x6,%ebx
  1030a2:	7f 0b                	jg     1030af <vprintfmt+0x14e>
  1030a4:	8b 34 9d 94 3b 10 00 	mov    0x103b94(,%ebx,4),%esi
  1030ab:	85 f6                	test   %esi,%esi
  1030ad:	75 23                	jne    1030d2 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  1030af:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1030b3:	c7 44 24 08 c1 3b 10 	movl   $0x103bc1,0x8(%esp)
  1030ba:	00 
  1030bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c5:	89 04 24             	mov    %eax,(%esp)
  1030c8:	e8 61 fe ff ff       	call   102f2e <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1030cd:	e9 60 02 00 00       	jmp    103332 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  1030d2:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1030d6:	c7 44 24 08 ca 3b 10 	movl   $0x103bca,0x8(%esp)
  1030dd:	00 
  1030de:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e8:	89 04 24             	mov    %eax,(%esp)
  1030eb:	e8 3e fe ff ff       	call   102f2e <printfmt>
            break;
  1030f0:	e9 3d 02 00 00       	jmp    103332 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1030f5:	8b 45 14             	mov    0x14(%ebp),%eax
  1030f8:	8d 50 04             	lea    0x4(%eax),%edx
  1030fb:	89 55 14             	mov    %edx,0x14(%ebp)
  1030fe:	8b 30                	mov    (%eax),%esi
  103100:	85 f6                	test   %esi,%esi
  103102:	75 05                	jne    103109 <vprintfmt+0x1a8>
                p = "(null)";
  103104:	be cd 3b 10 00       	mov    $0x103bcd,%esi
            }
            if (width > 0 && padc != '-') {
  103109:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10310d:	7e 76                	jle    103185 <vprintfmt+0x224>
  10310f:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103113:	74 70                	je     103185 <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103115:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103118:	89 44 24 04          	mov    %eax,0x4(%esp)
  10311c:	89 34 24             	mov    %esi,(%esp)
  10311f:	e8 ba f7 ff ff       	call   1028de <strnlen>
  103124:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103127:	29 c2                	sub    %eax,%edx
  103129:	89 d0                	mov    %edx,%eax
  10312b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10312e:	eb 16                	jmp    103146 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  103130:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103134:	8b 55 0c             	mov    0xc(%ebp),%edx
  103137:	89 54 24 04          	mov    %edx,0x4(%esp)
  10313b:	89 04 24             	mov    %eax,(%esp)
  10313e:	8b 45 08             	mov    0x8(%ebp),%eax
  103141:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103143:	ff 4d e8             	decl   -0x18(%ebp)
  103146:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10314a:	7f e4                	jg     103130 <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10314c:	eb 37                	jmp    103185 <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  10314e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103152:	74 1f                	je     103173 <vprintfmt+0x212>
  103154:	83 fb 1f             	cmp    $0x1f,%ebx
  103157:	7e 05                	jle    10315e <vprintfmt+0x1fd>
  103159:	83 fb 7e             	cmp    $0x7e,%ebx
  10315c:	7e 15                	jle    103173 <vprintfmt+0x212>
                    putch('?', putdat);
  10315e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103161:	89 44 24 04          	mov    %eax,0x4(%esp)
  103165:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10316c:	8b 45 08             	mov    0x8(%ebp),%eax
  10316f:	ff d0                	call   *%eax
  103171:	eb 0f                	jmp    103182 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  103173:	8b 45 0c             	mov    0xc(%ebp),%eax
  103176:	89 44 24 04          	mov    %eax,0x4(%esp)
  10317a:	89 1c 24             	mov    %ebx,(%esp)
  10317d:	8b 45 08             	mov    0x8(%ebp),%eax
  103180:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103182:	ff 4d e8             	decl   -0x18(%ebp)
  103185:	89 f0                	mov    %esi,%eax
  103187:	8d 70 01             	lea    0x1(%eax),%esi
  10318a:	0f b6 00             	movzbl (%eax),%eax
  10318d:	0f be d8             	movsbl %al,%ebx
  103190:	85 db                	test   %ebx,%ebx
  103192:	74 27                	je     1031bb <vprintfmt+0x25a>
  103194:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103198:	78 b4                	js     10314e <vprintfmt+0x1ed>
  10319a:	ff 4d e4             	decl   -0x1c(%ebp)
  10319d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1031a1:	79 ab                	jns    10314e <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  1031a3:	eb 16                	jmp    1031bb <vprintfmt+0x25a>
                putch(' ', putdat);
  1031a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031ac:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1031b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b6:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  1031b8:	ff 4d e8             	decl   -0x18(%ebp)
  1031bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031bf:	7f e4                	jg     1031a5 <vprintfmt+0x244>
            }
            break;
  1031c1:	e9 6c 01 00 00       	jmp    103332 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1031c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031cd:	8d 45 14             	lea    0x14(%ebp),%eax
  1031d0:	89 04 24             	mov    %eax,(%esp)
  1031d3:	e8 0b fd ff ff       	call   102ee3 <getint>
  1031d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031db:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1031de:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1031e4:	85 d2                	test   %edx,%edx
  1031e6:	79 26                	jns    10320e <vprintfmt+0x2ad>
                putch('-', putdat);
  1031e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031ef:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1031f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f9:	ff d0                	call   *%eax
                num = -(long long)num;
  1031fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103201:	f7 d8                	neg    %eax
  103203:	83 d2 00             	adc    $0x0,%edx
  103206:	f7 da                	neg    %edx
  103208:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10320b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10320e:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103215:	e9 a8 00 00 00       	jmp    1032c2 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  10321a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10321d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103221:	8d 45 14             	lea    0x14(%ebp),%eax
  103224:	89 04 24             	mov    %eax,(%esp)
  103227:	e8 64 fc ff ff       	call   102e90 <getuint>
  10322c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10322f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103232:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103239:	e9 84 00 00 00       	jmp    1032c2 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  10323e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103241:	89 44 24 04          	mov    %eax,0x4(%esp)
  103245:	8d 45 14             	lea    0x14(%ebp),%eax
  103248:	89 04 24             	mov    %eax,(%esp)
  10324b:	e8 40 fc ff ff       	call   102e90 <getuint>
  103250:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103253:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103256:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10325d:	eb 63                	jmp    1032c2 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  10325f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103262:	89 44 24 04          	mov    %eax,0x4(%esp)
  103266:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  10326d:	8b 45 08             	mov    0x8(%ebp),%eax
  103270:	ff d0                	call   *%eax
            putch('x', putdat);
  103272:	8b 45 0c             	mov    0xc(%ebp),%eax
  103275:	89 44 24 04          	mov    %eax,0x4(%esp)
  103279:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103280:	8b 45 08             	mov    0x8(%ebp),%eax
  103283:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103285:	8b 45 14             	mov    0x14(%ebp),%eax
  103288:	8d 50 04             	lea    0x4(%eax),%edx
  10328b:	89 55 14             	mov    %edx,0x14(%ebp)
  10328e:	8b 00                	mov    (%eax),%eax
  103290:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103293:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10329a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1032a1:	eb 1f                	jmp    1032c2 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1032a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1032a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032aa:	8d 45 14             	lea    0x14(%ebp),%eax
  1032ad:	89 04 24             	mov    %eax,(%esp)
  1032b0:	e8 db fb ff ff       	call   102e90 <getuint>
  1032b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1032bb:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1032c2:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1032c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032c9:	89 54 24 18          	mov    %edx,0x18(%esp)
  1032cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032d0:	89 54 24 14          	mov    %edx,0x14(%esp)
  1032d4:	89 44 24 10          	mov    %eax,0x10(%esp)
  1032d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032db:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1032de:	89 44 24 08          	mov    %eax,0x8(%esp)
  1032e2:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1032e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f0:	89 04 24             	mov    %eax,(%esp)
  1032f3:	e8 94 fa ff ff       	call   102d8c <printnum>
            break;
  1032f8:	eb 38                	jmp    103332 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1032fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  103301:	89 1c 24             	mov    %ebx,(%esp)
  103304:	8b 45 08             	mov    0x8(%ebp),%eax
  103307:	ff d0                	call   *%eax
            break;
  103309:	eb 27                	jmp    103332 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10330b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103312:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103319:	8b 45 08             	mov    0x8(%ebp),%eax
  10331c:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  10331e:	ff 4d 10             	decl   0x10(%ebp)
  103321:	eb 03                	jmp    103326 <vprintfmt+0x3c5>
  103323:	ff 4d 10             	decl   0x10(%ebp)
  103326:	8b 45 10             	mov    0x10(%ebp),%eax
  103329:	48                   	dec    %eax
  10332a:	0f b6 00             	movzbl (%eax),%eax
  10332d:	3c 25                	cmp    $0x25,%al
  10332f:	75 f2                	jne    103323 <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  103331:	90                   	nop
    while (1) {
  103332:	e9 36 fc ff ff       	jmp    102f6d <vprintfmt+0xc>
                return;
  103337:	90                   	nop
        }
    }
}
  103338:	83 c4 40             	add    $0x40,%esp
  10333b:	5b                   	pop    %ebx
  10333c:	5e                   	pop    %esi
  10333d:	5d                   	pop    %ebp
  10333e:	c3                   	ret    

0010333f <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10333f:	f3 0f 1e fb          	endbr32 
  103343:	55                   	push   %ebp
  103344:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103346:	8b 45 0c             	mov    0xc(%ebp),%eax
  103349:	8b 40 08             	mov    0x8(%eax),%eax
  10334c:	8d 50 01             	lea    0x1(%eax),%edx
  10334f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103352:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103355:	8b 45 0c             	mov    0xc(%ebp),%eax
  103358:	8b 10                	mov    (%eax),%edx
  10335a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10335d:	8b 40 04             	mov    0x4(%eax),%eax
  103360:	39 c2                	cmp    %eax,%edx
  103362:	73 12                	jae    103376 <sprintputch+0x37>
        *b->buf ++ = ch;
  103364:	8b 45 0c             	mov    0xc(%ebp),%eax
  103367:	8b 00                	mov    (%eax),%eax
  103369:	8d 48 01             	lea    0x1(%eax),%ecx
  10336c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10336f:	89 0a                	mov    %ecx,(%edx)
  103371:	8b 55 08             	mov    0x8(%ebp),%edx
  103374:	88 10                	mov    %dl,(%eax)
    }
}
  103376:	90                   	nop
  103377:	5d                   	pop    %ebp
  103378:	c3                   	ret    

00103379 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103379:	f3 0f 1e fb          	endbr32 
  10337d:	55                   	push   %ebp
  10337e:	89 e5                	mov    %esp,%ebp
  103380:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103383:	8d 45 14             	lea    0x14(%ebp),%eax
  103386:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103389:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10338c:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103390:	8b 45 10             	mov    0x10(%ebp),%eax
  103393:	89 44 24 08          	mov    %eax,0x8(%esp)
  103397:	8b 45 0c             	mov    0xc(%ebp),%eax
  10339a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10339e:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a1:	89 04 24             	mov    %eax,(%esp)
  1033a4:	e8 08 00 00 00       	call   1033b1 <vsnprintf>
  1033a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1033ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1033af:	c9                   	leave  
  1033b0:	c3                   	ret    

001033b1 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1033b1:	f3 0f 1e fb          	endbr32 
  1033b5:	55                   	push   %ebp
  1033b6:	89 e5                	mov    %esp,%ebp
  1033b8:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1033bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1033be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1033c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033c4:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ca:	01 d0                	add    %edx,%eax
  1033cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1033d6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1033da:	74 0a                	je     1033e6 <vsnprintf+0x35>
  1033dc:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1033df:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033e2:	39 c2                	cmp    %eax,%edx
  1033e4:	76 07                	jbe    1033ed <vsnprintf+0x3c>
        return -E_INVAL;
  1033e6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1033eb:	eb 2a                	jmp    103417 <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1033ed:	8b 45 14             	mov    0x14(%ebp),%eax
  1033f0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1033f4:	8b 45 10             	mov    0x10(%ebp),%eax
  1033f7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1033fb:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1033fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  103402:	c7 04 24 3f 33 10 00 	movl   $0x10333f,(%esp)
  103409:	e8 53 fb ff ff       	call   102f61 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10340e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103411:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103414:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103417:	c9                   	leave  
  103418:	c3                   	ret    

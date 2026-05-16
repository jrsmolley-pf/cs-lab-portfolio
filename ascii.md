# ASCII Escape Reference

Terminal-friendly reference for the 7-bit ASCII set: decimal, hex, glyph/name, control notation, and common escaping forms.

> Scope: ASCII `0–127` only. For Unicode beyond ASCII, prefer code point notation such as `U+1F600`, language-specific Unicode escapes, or UTF-8 byte escapes.

## Quick escape rules

| Context | General form | Example for `A` | Example for newline | Notes |
|---|---:|---:|---:|---|
| C / Python / JavaScript string hex | `\xHH` | `\x41` | `\x0A` | Works for ASCII-range characters in most C-like/Python/JS string contexts. |
| JSON string | `\u00HH` | `\u0041` | `\n` or `\u000A` | JSON does **not** support `\xHH`. Raw control characters are invalid. |
| URL percent-encoding | `%HH` | `%41` | `%0A` | Unreserved URL chars may remain raw; percent-encoding always identifies the byte. |
| HTML numeric entity | `&#xHH;` or `&#DD;` | `&#x41;` / `&#65;` | Usually not useful | Use named entities for `<`, `>`, `&`, quotes. Many controls are invalid/non-portable in HTML. |
| Bash ANSI-C quoted string | `$'\xHH'` | `$'\x41'` | `$'\n'` | Bash/zsh support ANSI-C quoting. Plain POSIX `sh` may not. |
| Regex hex escape | `\xHH` | `\x41` | `\x0A` | Syntax varies by engine; metacharacters often need a leading backslash. |
| Control-key notation | `^X` | N/A | `^J` | Common terminal notation: `^[` = ESC, `^M` = CR, `^J` = LF. |

## Common named escapes

```text
\0   NUL    Null byte                  \a   BEL    Bell
\b   BS     Backspace                  \t   HT     Horizontal tab
\n   LF     Line feed / newline         \v   VT     Vertical tab
\f   FF     Form feed                  \r   CR     Carriage return
\\   Backslash                         \"   Double quote
\'   Single quote / apostrophe         \e   ESC    Escape, common in Bash/GCC, not standard JSON
```

## Regex metacharacters that commonly need escaping

```text
.  ^  $  *  +  ?  {  }  [  ]  \  |  (  )

Outside a character class: prefix these with backslash, e.g. `\.` for a literal dot.
Inside a character class `[ ... ]`: escape `\`, `]`, `-`, and often `^` when it appears first.
```

## Full ASCII table

Legend:

- `Ctrl` = caret/control-key notation, where applicable.
- `C/Py/JS short` = shortest common string form. Use the `C/Py/JS hex` column for a universal ASCII hex form.
- `JSON` = JSON-safe string representation. Raw controls are represented as `\u00HH` unless a JSON named escape exists.
- `URL` = percent-encoded byte form.
- `HTML` = named entity where common, plus hex numeric entity. Controls are listed for completeness but are not generally useful in HTML.
- `Bash` = Bash/zsh quoted form.
- `Regex` = literal-ish regex form for common PCRE/JS-like engines; check your exact regex engine.

```text
Dec  Hex   Glyph  Name                    Ctrl  C/Py/JS short  C/Py/JS hex  JSON     URL  HTML             Bash     Regex
---  ----  -----  ----------------------  ----  -------------  -----------  -------  ---  ---------------  -------  -----
0    0x00  <NUL>  Null                    ^@    \0             \x00         \u0000   %00  &#x00;           $'\x00'  \x00 
1    0x01  <SOH>  Start of Heading        ^A    \x01           \x01         \u0001   %01  &#x01;           $'\x01'  \x01 
2    0x02  <STX>  Start of Text           ^B    \x02           \x02         \u0002   %02  &#x02;           $'\x02'  \x02 
3    0x03  <ETX>  End of Text             ^C    \x03           \x03         \u0003   %03  &#x03;           $'\x03'  \x03 
4    0x04  <EOT>  End of Transmission     ^D    \x04           \x04         \u0004   %04  &#x04;           $'\x04'  \x04 
5    0x05  <ENQ>  Enquiry                 ^E    \x05           \x05         \u0005   %05  &#x05;           $'\x05'  \x05 
6    0x06  <ACK>  Acknowledge             ^F    \x06           \x06         \u0006   %06  &#x06;           $'\x06'  \x06 
7    0x07  <BEL>  Bell                    ^G    \a             \x07         \u0007   %07  &#x07;           $'\a'    \x07 
8    0x08  <BS>   Backspace               ^H    \b             \x08         \b       %08  &#x08;           $'\b'    \x08 
9    0x09  <HT>   Horizontal Tab          ^I    \t             \x09         \t       %09  &#x09;           $'\t'    \x09 
10   0x0A  <LF>   Line Feed               ^J    \n             \x0A         \n       %0A  &#x0A;           $'\n'    \x0A 
11   0x0B  <VT>   Vertical Tab            ^K    \v             \x0B         \u000B   %0B  &#x0B;           $'\v'    \x0B 
12   0x0C  <FF>   Form Feed               ^L    \f             \x0C         \f       %0C  &#x0C;           $'\f'    \x0C 
13   0x0D  <CR>   Carriage Return         ^M    \r             \x0D         \r       %0D  &#x0D;           $'\r'    \x0D 
14   0x0E  <SO>   Shift Out               ^N    \x0E           \x0E         \u000E   %0E  &#x0E;           $'\x0E'  \x0E 
15   0x0F  <SI>   Shift In                ^O    \x0F           \x0F         \u000F   %0F  &#x0F;           $'\x0F'  \x0F 
16   0x10  <DLE>  Data Link Escape        ^P    \x10           \x10         \u0010   %10  &#x10;           $'\x10'  \x10 
17   0x11  <DC1>  Device Control 1        ^Q    \x11           \x11         \u0011   %11  &#x11;           $'\x11'  \x11 
18   0x12  <DC2>  Device Control 2        ^R    \x12           \x12         \u0012   %12  &#x12;           $'\x12'  \x12 
19   0x13  <DC3>  Device Control 3        ^S    \x13           \x13         \u0013   %13  &#x13;           $'\x13'  \x13 
20   0x14  <DC4>  Device Control 4        ^T    \x14           \x14         \u0014   %14  &#x14;           $'\x14'  \x14 
21   0x15  <NAK>  Negative Acknowledge    ^U    \x15           \x15         \u0015   %15  &#x15;           $'\x15'  \x15 
22   0x16  <SYN>  Synchronous Idle        ^V    \x16           \x16         \u0016   %16  &#x16;           $'\x16'  \x16 
23   0x17  <ETB>  End Transmission Block  ^W    \x17           \x17         \u0017   %17  &#x17;           $'\x17'  \x17 
24   0x18  <CAN>  Cancel                  ^X    \x18           \x18         \u0018   %18  &#x18;           $'\x18'  \x18 
25   0x19  <EM>   End of Medium           ^Y    \x19           \x19         \u0019   %19  &#x19;           $'\x19'  \x19 
26   0x1A  <SUB>  Substitute              ^Z    \x1A           \x1A         \u001A   %1A  &#x1A;           $'\x1A'  \x1A 
27   0x1B  <ESC>  Escape                  ^[    \e*            \x1B         \u001B   %1B  &#x1B;           $'\e'    \x1B 
28   0x1C  <FS>   File Separator          ^\    \x1C           \x1C         \u001C   %1C  &#x1C;           $'\x1C'  \x1C 
29   0x1D  <GS>   Group Separator         ^]    \x1D           \x1D         \u001D   %1D  &#x1D;           $'\x1D'  \x1D 
30   0x1E  <RS>   Record Separator        ^^    \x1E           \x1E         \u001E   %1E  &#x1E;           $'\x1E'  \x1E 
31   0x1F  <US>   Unit Separator          ^_    \x1F           \x1F         \u001F   %1F  &#x1F;           $'\x1F'  \x1F 
32   0x20  <SP>   Space                                        \x20                  %20  &#x20;           ' '           
33   0x21  !      Exclamation Mark              !              \x21         !        %21  &#x21;           '!'      !    
34   0x22  "      Double Quote                  \"             \x22         \"       %22  &quot; / &#x22;  '"'      "    
35   0x23  #      Number Sign                   #              \x23         #        %23  &#x23;           '#'      #    
36   0x24  $      Dollar Sign                   $              \x24         $        %24  &#x24;           '$'      \$   
37   0x25  %      Percent Sign                  %              \x25         %        %25  &#x25;           '%'      %    
38   0x26  &      Ampersand                     &              \x26         &        %26  &amp; / &#x26;   '&'      &    
39   0x27  '      Apostrophe                    \'             \x27         '        %27  &apos; / &#x27;  $'\''    '    
40   0x28  (      Left Parenthesis              (              \x28         (        %28  &#x28;           '('      \(   
41   0x29  )      Right Parenthesis             )              \x29         )        %29  &#x29;           ')'      \)   
42   0x2A  *      Asterisk                      *              \x2A         *        %2A  &#x2A;           '*'      \*   
43   0x2B  +      Plus Sign                     +              \x2B         +        %2B  &#x2B;           '+'      \+   
44   0x2C  ,      Comma                         ,              \x2C         ,        %2C  &#x2C;           ','      ,    
45   0x2D  -      Hyphen-Minus                  -              \x2D         -        %2D  &#x2D;           '-'      -    
46   0x2E  .      Period                        .              \x2E         .        %2E  &#x2E;           '.'      \.   
47   0x2F  /      Slash                         /              \x2F         / or \/  %2F  &#x2F;           '/'      /    
48   0x30  0      Digit 0                       0              \x30         0        %30  &#x30;           '0'      0    
49   0x31  1      Digit 1                       1              \x31         1        %31  &#x31;           '1'      1    
50   0x32  2      Digit 2                       2              \x32         2        %32  &#x32;           '2'      2    
51   0x33  3      Digit 3                       3              \x33         3        %33  &#x33;           '3'      3    
52   0x34  4      Digit 4                       4              \x34         4        %34  &#x34;           '4'      4    
53   0x35  5      Digit 5                       5              \x35         5        %35  &#x35;           '5'      5    
54   0x36  6      Digit 6                       6              \x36         6        %36  &#x36;           '6'      6    
55   0x37  7      Digit 7                       7              \x37         7        %37  &#x37;           '7'      7    
56   0x38  8      Digit 8                       8              \x38         8        %38  &#x38;           '8'      8    
57   0x39  9      Digit 9                       9              \x39         9        %39  &#x39;           '9'      9    
58   0x3A  :      Colon                         :              \x3A         :        %3A  &#x3A;           ':'      :    
59   0x3B  ;      Semicolon                     ;              \x3B         ;        %3B  &#x3B;           ';'      ;    
60   0x3C  <      Less Than                     <              \x3C         <        %3C  &lt; / &#x3C;    '<'      <    
61   0x3D  =      Equals                        =              \x3D         =        %3D  &#x3D;           '='      =    
62   0x3E  >      Greater Than                  >              \x3E         >        %3E  &gt; / &#x3E;    '>'      >    
63   0x3F  ?      Question Mark                 ?              \x3F         ?        %3F  &#x3F;           '?'      \?   
64   0x40  @      At Sign                       @              \x40         @        %40  &#x40;           '@'      @    
65   0x41  A      Uppercase A                   A              \x41         A        %41  &#x41;           'A'      A    
66   0x42  B      Uppercase B                   B              \x42         B        %42  &#x42;           'B'      B    
67   0x43  C      Uppercase C                   C              \x43         C        %43  &#x43;           'C'      C    
68   0x44  D      Uppercase D                   D              \x44         D        %44  &#x44;           'D'      D    
69   0x45  E      Uppercase E                   E              \x45         E        %45  &#x45;           'E'      E    
70   0x46  F      Uppercase F                   F              \x46         F        %46  &#x46;           'F'      F    
71   0x47  G      Uppercase G                   G              \x47         G        %47  &#x47;           'G'      G    
72   0x48  H      Uppercase H                   H              \x48         H        %48  &#x48;           'H'      H    
73   0x49  I      Uppercase I                   I              \x49         I        %49  &#x49;           'I'      I    
74   0x4A  J      Uppercase J                   J              \x4A         J        %4A  &#x4A;           'J'      J    
75   0x4B  K      Uppercase K                   K              \x4B         K        %4B  &#x4B;           'K'      K    
76   0x4C  L      Uppercase L                   L              \x4C         L        %4C  &#x4C;           'L'      L    
77   0x4D  M      Uppercase M                   M              \x4D         M        %4D  &#x4D;           'M'      M    
78   0x4E  N      Uppercase N                   N              \x4E         N        %4E  &#x4E;           'N'      N    
79   0x4F  O      Uppercase O                   O              \x4F         O        %4F  &#x4F;           'O'      O    
80   0x50  P      Uppercase P                   P              \x50         P        %50  &#x50;           'P'      P    
81   0x51  Q      Uppercase Q                   Q              \x51         Q        %51  &#x51;           'Q'      Q    
82   0x52  R      Uppercase R                   R              \x52         R        %52  &#x52;           'R'      R    
83   0x53  S      Uppercase S                   S              \x53         S        %53  &#x53;           'S'      S    
84   0x54  T      Uppercase T                   T              \x54         T        %54  &#x54;           'T'      T    
85   0x55  U      Uppercase U                   U              \x55         U        %55  &#x55;           'U'      U    
86   0x56  V      Uppercase V                   V              \x56         V        %56  &#x56;           'V'      V    
87   0x57  W      Uppercase W                   W              \x57         W        %57  &#x57;           'W'      W    
88   0x58  X      Uppercase X                   X              \x58         X        %58  &#x58;           'X'      X    
89   0x59  Y      Uppercase Y                   Y              \x59         Y        %59  &#x59;           'Y'      Y    
90   0x5A  Z      Uppercase Z                   Z              \x5A         Z        %5A  &#x5A;           'Z'      Z    
91   0x5B  [      Left Square Bracket           [              \x5B         [        %5B  &#x5B;           '['      \[   
92   0x5C  \      Backslash                     \\             \x5C         \\       %5C  &#x5C;           $'\\'    \\   
93   0x5D  ]      Right Square Bracket          ]              \x5D         ]        %5D  &#x5D;           ']'      \]   
94   0x5E  ^      Caret                         ^              \x5E         ^        %5E  &#x5E;           '^'      \^   
95   0x5F  _      Underscore                    _              \x5F         _        %5F  &#x5F;           '_'      _    
96   0x60  `      Grave Accent                  `              \x60         `        %60  &#x60;           '`'      `    
97   0x61  a      Lowercase a                   a              \x61         a        %61  &#x61;           'a'      a    
98   0x62  b      Lowercase b                   b              \x62         b        %62  &#x62;           'b'      b    
99   0x63  c      Lowercase c                   c              \x63         c        %63  &#x63;           'c'      c    
100  0x64  d      Lowercase d                   d              \x64         d        %64  &#x64;           'd'      d    
101  0x65  e      Lowercase e                   e              \x65         e        %65  &#x65;           'e'      e    
102  0x66  f      Lowercase f                   f              \x66         f        %66  &#x66;           'f'      f    
103  0x67  g      Lowercase g                   g              \x67         g        %67  &#x67;           'g'      g    
104  0x68  h      Lowercase h                   h              \x68         h        %68  &#x68;           'h'      h    
105  0x69  i      Lowercase i                   i              \x69         i        %69  &#x69;           'i'      i    
106  0x6A  j      Lowercase j                   j              \x6A         j        %6A  &#x6A;           'j'      j    
107  0x6B  k      Lowercase k                   k              \x6B         k        %6B  &#x6B;           'k'      k    
108  0x6C  l      Lowercase l                   l              \x6C         l        %6C  &#x6C;           'l'      l    
109  0x6D  m      Lowercase m                   m              \x6D         m        %6D  &#x6D;           'm'      m    
110  0x6E  n      Lowercase n                   n              \x6E         n        %6E  &#x6E;           'n'      n    
111  0x6F  o      Lowercase o                   o              \x6F         o        %6F  &#x6F;           'o'      o    
112  0x70  p      Lowercase p                   p              \x70         p        %70  &#x70;           'p'      p    
113  0x71  q      Lowercase q                   q              \x71         q        %71  &#x71;           'q'      q    
114  0x72  r      Lowercase r                   r              \x72         r        %72  &#x72;           'r'      r    
115  0x73  s      Lowercase s                   s              \x73         s        %73  &#x73;           's'      s    
116  0x74  t      Lowercase t                   t              \x74         t        %74  &#x74;           't'      t    
117  0x75  u      Lowercase u                   u              \x75         u        %75  &#x75;           'u'      u    
118  0x76  v      Lowercase v                   v              \x76         v        %76  &#x76;           'v'      v    
119  0x77  w      Lowercase w                   w              \x77         w        %77  &#x77;           'w'      w    
120  0x78  x      Lowercase x                   x              \x78         x        %78  &#x78;           'x'      x    
121  0x79  y      Lowercase y                   y              \x79         y        %79  &#x79;           'y'      y    
122  0x7A  z      Lowercase z                   z              \x7A         z        %7A  &#x7A;           'z'      z    
123  0x7B  {      Left Curly Brace              {              \x7B         {        %7B  &#x7B;           '{'      \{   
124  0x7C  |      Vertical Bar                  |              \x7C         |        %7C  &#x7C;           '|'      \|   
125  0x7D  }      Right Curly Brace             }              \x7D         }        %7D  &#x7D;           '}'      \}   
126  0x7E  ~      Tilde                         ~              \x7E         ~        %7E  &#x7E;           '~'      ~    
127  0x7F  <DEL>  Delete                  ^?    \x7F           \x7F         \u007F   %7F  &#x7F;           $'\x7F'  \x7F 
```

## Practical notes

- ASCII control characters `0–31` and `127` are usually not visible when printed. Use names, caret notation, or hex escapes when documenting them.
- `LF` is decimal `10`, hex `0x0A`, escape `\n`, terminal control notation `^J`.
- `CR` is decimal `13`, hex `0x0D`, escape `\r`, terminal control notation `^M`.
- Windows text files commonly use `CRLF`: `\r\n`, bytes `0x0D 0x0A`.
- Space is decimal `32`, hex `0x20`, URL `%20`; in HTML, `&nbsp;` is a non-breaking space, not the same as ordinary ASCII space.
- In URLs, form encoding often uses `+` for a space in query/form bodies, but `%20` is the direct percent-encoding of ASCII space.
- In JSON, escape control characters with `\u00HH` or the named JSON escapes: `\b`, `\t`, `\n`, `\f`, `\r`, `\"`, `\\`, and optionally `\/`.

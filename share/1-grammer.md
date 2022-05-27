# Objective-C

## 简介

Objective-C 是一门基于 C 拓展而来的程序设计语言, 其在 C 的基础上加了一层, 以支持对象的创建和操作。

20 世纪 80 年代早期由 Brad J.Cox(2021 年去逝)发明, 一家名为 NeXT 的公司在 1988 年获得了 Objective-C 语言的授权, 1996 年苹果收购了 NeXT, 2007 年苹果发布了 Objective-C2.0. iPhone 于 2007 年发布, 并以 Objective-C 作为了 iPhone 应用开发语言。

## 环境安装

- `Xcode`
- `GCC` or `clang`

## Hello World

代码:

```objective-c
#import <Foundation/Foundation.h>

int main(int argc, char * argv[]) {
  @autoreleasepool {
    NSLog(@"Hello World!");
  }
  return 0;
}
```

打开终端运行:

```sh
clang -fobjc-arc hello-world.m -o helloworld
./helloworld
```

效果:

```sh
2022-05-23 14:43:39.803 helloworld[54597:24106292] Hello World!
```

## 数据类型

- `char`

```objective-c
char c = 127;
```

- `short`

```objective-c
short s = 32767;
```

- `int`

```objective-c
int i = 2147483647;
```

- `long`

```objective-c
long l = 9223372036854775807;
```

- `float`

```objective-c
float f = 1.0;
```

- `double`

```objective-c
double d = 1.0;
```

- `结构体`

```objective-c
struct User {
  char *name;
  int age;
};
struct User user;
user.age = 1;
user.name = "张三";
```

- `枚举`

```c
enum DAY {
  MON = 1,
  TUE,
  WEN,
  THU,
  FRI,
  SAT,
  SUN
};
// 枚举成员本身就是一个常量
enum DAY day = WEN;
```

- `共用体/联合体`
  共用体占用的内存为各个成员所占用的内存的最大值

```c
union Data {
   int i;
   float f;
   char str[20];
};
```

- `位域`

```c
struct {
  unsigned int widthValidated : 1;
  unsigned int heightValidated : 1;
} status;
```

- `字符串`

```c
char str[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
char *str = "Hello"; // 不能改变成员的值
```

- `数组`

```c
int arr[4] = {1, 2, 3, 4};
int arr[4][5] = {}; // 二维数组
```

- `NULL`

```c
int *p = NULL; // 指向0x00的指针
```

- `void`

```objective-c
void fun(void) {
  NSLog(@"test");
}
```

**typedef**

> 为类型定义别名

```c
typedef struct User {
  char *name;
  unsigned short age;
} User;
User user;

typedef unsigned char byte;
```

## 运算符

算数: `+ - * / % ++ --`
赋值: `= += -= *= /= %= &= |= ^= <<= >>=`
比较: `== != < <= > >=`
逻辑: `&& || !`
位运算: `& | ~ ^ << >>`
三元运算符: `?:`
强制类型转换: `()`

```c
int f = 1.1;
int i = (int) f; // i == 1
```

变量大小: `sizeof()`

```c
int f;
int size = sizeof(f); // size == 4

struct User {
  char name[20];
  int age;
} user;
int size = sizeof(user); // size == 24
```

取地址: `&`

```c
int a = 1;
int *b = &a; // b == 0xxxxxxxxxxxxx
```

间接寻址: `*`

```c
int a = 1;
int *b = &a; // *b == 1
*b = 2; // a == 2
```

## 循环

`for`
`while`
`do while`
`break`
`continue`
`goto label`

## 条件语句

`if`
`switch`

## 预处理器

> C 预处理器不是编译器的组成部分，但是它是编译过程中一个单独的步骤，简言之，C 预处理器只不过是一个文本替换工具而已，它们会指示编译器在实际编译之前完成所需的预处理。

所有的预处理器命令都是以井号（#）开头。

- `#include`
  引用头文件，引用头文件相当于复制头文件的内容，头文件内部定义了常量、宏、系统全局变量、函数原型，如果要使用这些数据，就必须引入该头文件，否则编译器找不到对应数据的定义。

  ```c
  // 引用系统头文件
  #include <file>
  // 引用用户头文件
  #include "file"
  ```

  ```c
  // test.h
  void test (void);
  // test.m
  void test(void) {
    NSLog(@"test");
  }
  ```

  ```c
  // main.m
  #include "test.h"

  int main(void) {
    test(); // 如果不引入test.h编译器会报错, 提示Implicit declaration of function 'test' is invalid in C99
    return 0;
  }
  ```

  如果一个头文件被引用两次，编译器会处理两次头文件的内容，这将产生错误。为了防止这种情况，标准的做法是把文件的整个内容放在条件编译语句中，如下：

  ```c
  #ifndef HEADER_FILE
  #define HEADER_FILE

  void test (void);

  #endif
  ```

- `#define`

  定义一个宏

  宏是一种批量处理的称谓，它根据一系列预定义的规则替换一定的文本模式。

  ```c
  #define MAX_ARRAY_LENGTH 20
  #define sum(a, b) ((a) + (b))

  int main(void) {
    int sum1 = sum(1, 2); // 等价于 int sum1 = ((1) + (2));
    NSLog(@"%d", sum1); // 输出3
    NSLog(@"%d", MAX_ARRAY_LENGTH); // 输出20
    return 0;
  }
  ```

- `#undef`

  取消已定义的宏

- `#ifdef`

  如果宏已经定义，则返回真

- `#ifndef`

  如果宏没有定义，则返回真

- `#if`
- `#else`
- `#elif`
- `#endif`

```c
#import <Foundation/Foundation.h>

#define MAX_ARRAY_LENGTH 10

int main(void) {
#if MAX_ARRAY_LENGTH == 20
  NSLog(@"Ok");
#else
  NSLog(@"No");
#endif
  return 1;
}
```

## 修饰符

- `const`
  定义常量

```c
const int a = 1;
```

- `static`
  修饰局部变量, 该局部变量会被存储到静态数据区, 函数执行完成后, 该变量不会被重置
  ```c
  void test(void) {
    static int count = 0;
    count++;
  }
  ```
  修饰全局变量, 该变量只能在当前模块内使用, 不能被 extern 引用
  ```c
  // 所有模块共享
  int count = 0;
  // 模块独享
  static int count = 0;
  ```
- `extern`
  修饰变量声明, 表示引用一个全局变量
  ```c
  extern int count;
  ```

## 函数

```c
void greeting(char *name) {
  NSLog(@"hello %s", name);
}
greeting("张三"); // 输出 hello 张三
```

- 函数内不能再声明函数

### 函数指针

```c
void (*p)(char *) = greeting;
p("李四") // 输出 hello 李四
```

### 回调函数

```c
void callback(char *name) {
    NSLog(@"complete greeting to %s", name);
}
void greeting(char *name, void (*completion)(char *name)) {
  NSLog(@"hello %s", name);
  completion(name);
}

// 定义一个别名
typedef void (*CompleteHandler)(char *name);
void greeting(char *name, CompleteHandler completion) {
  NSLog(@"hello %s", name);
  completion(name);
}

greeting("李四", callback); // 输出 hello 李四 \n  complete greeting to 李四
```

当然函数指针也可以作为函数的返回值。

## Block

c 中的函数有几个缺点:

- 函数只能定义在代码顶层
- 无法定义匿名函数

```c
// 定义一个block
void (^greeting) (char *name) = ^(char *name) {
  NSLog(@"hello %s", name);
};
greeting("张三"); // 输出 hello 张三

// 定义一个别名
typedef void (^Greeting) (char *name);
Greeting greeting = ^(char *name) {
  NSLog(@"hello %s", name);
};
greeting("张三"); // 输出 hello 张三

// 作为函数参数
typedef void (^Callback)(void);
void greeting(char *name, Callback cb) {
  NSLog(@"hello %s", name);
  cb();
}
int main(void) {
  greeting("张三", ^{
    NSLog(@"done");
  });
}

// 作为函数返回值
typedef void (^Block)(char *name);
Block greetingWithPrefix(char *prefix) {
  return ^(char *name) {
      NSLog(@"%s %s", prefix, name);
  };
}
int main(void) {
  Block greeting = greetingWithPrefix("你好");
  greeting("张三");
}
```

这里有点类似`js`的闭包, `block`会捕获其内部使用到的外部变量, 但是:

- 捕获到的值仅仅是一个快照
- 捕获到的变量不能修改

我们可以给变量添加`__block`修饰符来改变这种行为, 被`__block`修饰符修饰的变量在被`block`捕获时, 捕获的变量会和原变量共享存储空间, 并且可以修改其值。

## 类

**定义一个类**

```objective-c
// Fraction.h
#import <Foundation/Foundation.h>

@interface Fraction: NSObject

-(int) numerator;
-(void) setNumerator: (int) n;

-(int) denominator;
-(void) setDenominator: (int) d;

-(void) print;

@end
```

```objective-c
// Fraction.m
#import "Fraction.h"

@implementation Fraction
{
  int numerator;
  int denominator;
}

-(int) numerator
{
  return numerator;
}
-(void) setNumerator: (int) n
{
  numerator = n;
}

-(int) denominator
{
  return denominator;
}
-(void) setDenominator: (int) d
{
  denominator = d;
}

-(void) print
{
  NSLog(@"%i/%i", numerator, denominator);
}

@end
```

`@interface`声明放到`.h`文件中表示该类是一个公有类, 若将其放到`.m`文件, 则该类是一个私有类, 本模块以外的代码无法访问。

**实例化类**

```objective-c
Fraction *frac1 = [[Fraction alloc] init];
```

**调用类实例方法**

```objective-c
[frac1 setNumerator: 1];
```

> 我们在为类定义成员变量时需要为成员定义`存取方法`(getter, setter), 这样很繁琐, 从 Objective-C 2.0 开始, 可自动生成`存取方法`。

**@property**

```objective-c
// Fraction.h
#import <Foundation/Foundation.h>

@interface Fraction: NSObject

@property int numerator, denominator;

-(void) print;

@end
```

```objective-c
// Fraction.m
#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(void) print
{
  NSLog(@"%i/%i", numerator, denominator);
}

@end
```

**@synthesize**

`@property`会自动生成`getter`和`setter`, 但是此时编译器生成的实例变量会以下划线(`_`)字符作为其名称的第一个字符。
我们可以用`@synthesize`自定义实例变量的名称, 但这不是必须的。

**具有多个参数的方法**

```objective-c
// 在Fraction.h中声明方法
-(void) setNumerator:(int)n andDenominator:(int)d;

// 在Fraction.m中定义方法
-(void) setNumerator:(int)n andDenominator:(int)d
{
  numerator = n;
  denominator = d;
}
// 调用该方法
[frac1 setNumerator: 4 andDenominator: 2];
```

**self**

在其他编程语言中的`this`在 OC 中称为`self`

**静态属性**

OC 的类不能定义静态属性, 但可以通过静态方法+模块全局变量模拟实现

**实例化**

OC 的类没有构造函数的概念, 实例化的过程是通过`init`实例方法实现的, 我们可以重载该方法从而自定义实例化过程。

```objective-c
-(instancetype) init
{
  self = [super init];

  if (self) {
    // 初始化
  }

  return self;
}
```

### 封装

#### 访问控制符

- `@private`
  私有, 仅该类方法可访问
- `@protected`(默认)
  受保护的, 该类和该类的子类方法可访问
- `@package`
  包内的, 当前包内可访问
- `@public`
  共有的, 任意地方可访问

```objective-c
@interface MyClass: NSObject
{
  @private
    int a;
    int b;
  @protected
    int c;
    int d;
  @package
    int e;
    int f;
  @public
    int g;
    int h;
}

@end
```

注意:

- 只能修饰属性, 不能修饰方法, 私有方法可以通过在`.m`文件中声明实现
- 在`.m`文件中定义的属性都只有本类可以访问, 访问修饰符不会生效

### 继承

**方法重写**

重写时, 方法返回类型必须同父类方法返回类型相同, 也可以返回相应的子类
重写时, 方法参数类型可以不同

```objective-c
// 父类方法
-(void) print;

// 子类方法重写
-(int) print; // 错误, 返回类型不同
```

**方法重载**

不支持方法重载

## Category

将类的方法进行分组(增强可读性), 它还提供了扩展现有类定义的简便方式。

**具名分类**

```objective-c
@interface Fraction (MathOps)

-(Fraction *) add: (Fraction *) f;
-(Fraction *) sub: (Fraction *) f;

@end
```

`Category`会影响子类, 所以所有继承自`Fraction`类的子类也会继承这两个方法。

它甚至可以扩展三方包中的类, 这有点类似 js 中直接修改原型。

具名分类只能扩展方法，不能扩展属性和实例变量。

**匿名分类**

```objective-c
@interface Fraction (MathOps)

-(Fraction *) add: (Fraction *) f;
-(Fraction *) sub: (Fraction *) f;

@end
```

- 匿名分类可以扩展实例变量和属性
- 匿名分类中声明的方法只能在`主实现区域`实现, 不能在`分离的实现区域`中实现
- 匿名分类声明的变量和方法都是`私有的`

## 协议

协议是多个类共享的一个方法列表, 有点类似`接口`。协议中列出的方法都没有相应的实现, 需要由使用者来实现。协议中有的方法是必须实现的, 有的方法是可以选择实现的。

定义一个协议

```objective-c
@protocol RouterProtocol

-(void) push(char *) path;

@end
```

使用一个协议

```objective-c
@interface Router: NSObject<RouterProtocol>

@end

@implementation Router

-(void) push: (char *) path
{
  NSLog(@"跳转到%s", path);
}

@end
```

## 错误处理

```objective-c
@try {
    <#Code that can potentially throw an exception#>
} @catch (NSException *exception) {
    <#Handle an exception thrown in the @try block#>
} @finally {
    <#Code that gets executed whether or not an exception is thrown#>
}
```

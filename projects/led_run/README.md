### LED Run

#### 下面以PYNQ-Z2为例，记录vivado设计的全过程
1. 打开vivado软件，选择create project, 输入项目名称比如(led_run), 放置于合理路径下，一路next。
2. 板子芯片选择：XC7Z020-1CLG400C，这个信息在板子官网都能看到，或者你可以到zz的[博客](https://fuquan99666.github.io/p/fpga0-%E5%8F%AF%E6%8E%A7%E7%BA%BF%E6%80%A7%E5%BA%8F%E5%88%97%E6%9C%BA/)中的第二部分找到。
3. 进入项目后，点击add sources，选择create file，输入文件名比如(led_run.v)，选择verilog，点击ok。
4. 在对应文件中输入led_run.v的代码，保存。代码没啥好说的，用一个寄存器作为计数器，每当计数器达到一定值(这个值需要结合芯片时钟频率、闪烁周期来设定), led取反，同时计数器归零，这样就能实现led灯闪烁的效果。
5. 点击Run Synthesis，等待完成。
6. 在完成Synthesis后，点击Open Synthesized Design，在上方的toolbar里点击windows，选择I/O Ports，我们需要设置Package Pins 和 I/O Std,其中前者是引脚位置，后者是引脚的电压标准。电压标准一般都是LVCMOS33，具体的引脚位置在这里是clk -> H16, led0 -> R14(同样都可以在我们提供的文档线路图中找到),设置完成后保存。
7. 点击Run Implementation，等待完成。
8. 点击Generate Bitstream，等待完成。
9. 点击Open Hardware Manager，连接到硬件，选择Program Device，选择生成的.bit文件，点击Program将代码烧录到FPGA中，等待完成。
10. 观察板子上的LED灯是否按照预期闪烁。
SECTIONS
{
    . = 0x7c00;
    .text :
    {
        _ftext = . ;/* 告诉链接器程序加载到内存的7c00处 */
    } = 0
}

ENTRY(_start)

SECTIONS
{
	. = 0xffff800000100000;
 
	PROVIDE(boottext = .);
	.text.boot : ALIGN(4096) {
		*(.boottext)
	}

 	.text : ALIGN(4K)
	{
		*(.text)
		PROVIDE(etext = .);
	}
 
	/* Read-only data. */
	.rodata : ALIGN(4K)
	{
		*(.rodata)
	}
 
	/* Read-write data (initialized) */
	.data : ALIGN(4K)
	{
		*(.data)
	}
	PROVIDE(edata = .);

	/* Read-write data (uninitialized) and stack */
	.bss : ALIGN(4K)
	{
		*(.bss)
		*(COMMON)
	}
	PROVIDE(end = .);
}
VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL clk_i
        SIGNAL rst_i
        SIGNAL led_1
        SIGNAL led_0
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        PORT Input clk_i
        PORT Input rst_i
        PORT Output led_1
        PORT Output led_0
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_3 ibuf
            PIN I clk_i
            PIN O XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_4 ibuf
            PIN I rst_i
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_5 obuf
            PIN I XLXN_14
            PIN O led_0
        END BLOCK
        BEGIN BLOCK XLXI_6 obuf
            PIN I XLXN_12
            PIN O led_1
        END BLOCK
        BEGIN BLOCK XLXI_7 inv
            PIN I XLXN_12
            PIN O XLXN_13
        END BLOCK
        BEGIN BLOCK XLXI_8 fdc
            PIN C XLXN_6
            PIN CLR XLXN_5
            PIN D XLXN_13
            PIN Q XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_9 fdc
            PIN C XLXN_6
            PIN CLR XLXN_5
            PIN D XLXN_14
            PIN Q XLXN_12
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_5 1296 752 R0
        INSTANCE XLXI_3 256 1488 R0
        INSTANCE XLXI_4 256 1584 R0
        BEGIN BRANCH clk_i
            WIRE 224 1456 256 1456
        END BRANCH
        IOMARKER 224 1456 clk_i R180 28
        BEGIN BRANCH rst_i
            WIRE 224 1552 256 1552
        END BRANCH
        IOMARKER 224 1552 rst_i R180 28
        BEGIN BRANCH led_1
            WIRE 1520 1328 1536 1328
        END BRANCH
        BEGIN BRANCH led_0
            WIRE 1520 720 1552 720
        END BRANCH
        IOMARKER 1552 720 led_0 R0 28
        INSTANCE XLXI_8 576 976 R0
        BEGIN BRANCH XLXN_6
            WIRE 480 1456 496 1456
            WIRE 496 1456 576 1456
            WIRE 496 848 576 848
            WIRE 496 848 496 1456
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 480 1552 528 1552
            WIRE 528 1552 576 1552
            WIRE 528 944 576 944
            WIRE 528 944 528 1552
        END BRANCH
        INSTANCE XLXI_9 576 1584 R0
        INSTANCE XLXI_7 256 752 R0
        INSTANCE XLXI_6 1296 1360 R0
        IOMARKER 1536 1328 led_1 R0 28
        BEGIN BRANCH XLXN_12
            WIRE 48 720 256 720
            WIRE 48 720 48 1680
            WIRE 48 1680 1120 1680
            WIRE 960 1328 1120 1328
            WIRE 1120 1328 1296 1328
            WIRE 1120 1328 1120 1680
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 480 720 576 720
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 560 1040 576 1040
            WIRE 576 1040 1120 1040
            WIRE 560 1040 560 1328
            WIRE 560 1328 576 1328
            WIRE 960 720 1120 720
            WIRE 1120 720 1296 720
            WIRE 1120 720 1120 1040
        END BRANCH
    END SHEET
END SCHEMATIC

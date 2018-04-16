VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_48
        SIGNAL XLXN_49
        SIGNAL XLXN_50
        SIGNAL XLXN_51
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL XLXN_54
        SIGNAL XLXN_55
        SIGNAL sw_0
        SIGNAL sw_1
        SIGNAL sw_2
        SIGNAL sw_3
        SIGNAL sw_4
        SIGNAL sw_5
        SIGNAL sw_6
        SIGNAL sw_7
        SIGNAL XLXN_81
        SIGNAL XLXN_82
        SIGNAL XLXN_96
        SIGNAL XLXN_97
        SIGNAL led7_seg_A
        SIGNAL led7_seg_B
        SIGNAL led7_seg_C
        SIGNAL led7_seg_D
        SIGNAL led7_seg_E
        SIGNAL led7_seg_F
        SIGNAL led7_seg_G
        SIGNAL led7_seg_DP
        SIGNAL led7_an_3
        SIGNAL led7_an_2
        SIGNAL led7_an_1
        SIGNAL led7_an_0
        PORT Input sw_0
        PORT Input sw_1
        PORT Input sw_2
        PORT Input sw_3
        PORT Input sw_4
        PORT Input sw_5
        PORT Input sw_6
        PORT Input sw_7
        PORT Output led7_seg_A
        PORT Output led7_seg_B
        PORT Output led7_seg_C
        PORT Output led7_seg_D
        PORT Output led7_seg_E
        PORT Output led7_seg_F
        PORT Output led7_seg_G
        PORT Output led7_seg_DP
        PORT Output led7_an_3
        PORT Output led7_an_2
        PORT Output led7_an_1
        PORT Output led7_an_0
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -224 64 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -32 64 -32 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 224 -224 128 -224 
            LINE N 224 -96 128 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 224 -224 128 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -96 64 -96 
            LINE N 224 -96 128 -96 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_9 xor2
            PIN I0 XLXN_49
            PIN I1 XLXN_48
            PIN O XLXN_12
        END BLOCK
        BEGIN BLOCK XLXI_10 xor2
            PIN I0 XLXN_51
            PIN I1 XLXN_50
            PIN O XLXN_11
        END BLOCK
        BEGIN BLOCK XLXI_11 xor2
            PIN I0 XLXN_53
            PIN I1 XLXN_52
            PIN O XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_12 xor2
            PIN I0 XLXN_55
            PIN I1 XLXN_54
            PIN O XLXN_9
        END BLOCK
        BEGIN BLOCK XLXI_13 xor2
            PIN I0 XLXN_9
            PIN I1 XLXN_10
            PIN O XLXN_14
        END BLOCK
        BEGIN BLOCK XLXI_14 xor2
            PIN I0 XLXN_11
            PIN I1 XLXN_12
            PIN O XLXN_13
        END BLOCK
        BEGIN BLOCK XLXI_15 xor2
            PIN I0 XLXN_14
            PIN I1 XLXN_13
            PIN O XLXN_81
        END BLOCK
        BEGIN BLOCK XLXI_25 ibuf4
            PIN I0 sw_0
            PIN I1 sw_1
            PIN I2 sw_2
            PIN I3 sw_3
            PIN O0 XLXN_48
            PIN O1 XLXN_49
            PIN O2 XLXN_50
            PIN O3 XLXN_51
        END BLOCK
        BEGIN BLOCK XLXI_26 ibuf4
            PIN I0 sw_4
            PIN I1 sw_5
            PIN I2 sw_6
            PIN I3 sw_7
            PIN O0 XLXN_52
            PIN O1 XLXN_53
            PIN O2 XLXN_54
            PIN O3 XLXN_55
        END BLOCK
        BEGIN BLOCK XLXI_30 inv
            PIN I XLXN_81
            PIN O XLXN_82
        END BLOCK
        BEGIN BLOCK XLXI_27 obuf4
            PIN I0 XLXN_96
            PIN I1 XLXN_82
            PIN I2 XLXN_82
            PIN I3 XLXN_96
            PIN O0 led7_seg_A
            PIN O1 led7_seg_B
            PIN O2 led7_seg_C
            PIN O3 led7_seg_D
        END BLOCK
        BEGIN BLOCK XLXI_28 obuf4
            PIN I0 XLXN_96
            PIN I1 XLXN_96
            PIN I2 XLXN_81
            PIN I3 XLXN_97
            PIN O0 led7_seg_E
            PIN O1 led7_seg_F
            PIN O2 led7_seg_G
            PIN O3 led7_seg_DP
        END BLOCK
        BEGIN BLOCK XLXI_29 obuf4
            PIN I0 XLXN_97
            PIN I1 XLXN_97
            PIN I2 XLXN_97
            PIN I3 XLXN_96
            PIN O0 led7_an_3
            PIN O1 led7_an_2
            PIN O2 led7_an_1
            PIN O3 led7_an_0
        END BLOCK
        BEGIN BLOCK XLXI_34 gnd
            PIN G XLXN_96
        END BLOCK
        BEGIN BLOCK XLXI_35 vcc
            PIN P XLXN_97
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_9 560 288 R0
        INSTANCE XLXI_11 560 608 R0
        INSTANCE XLXI_10 560 416 R0
        BEGIN BRANCH XLXN_48
            WIRE 528 160 560 160
        END BRANCH
        BEGIN BRANCH XLXN_49
            WIRE 528 224 560 224
        END BRANCH
        BEGIN BRANCH XLXN_50
            WIRE 528 288 560 288
        END BRANCH
        BEGIN BRANCH XLXN_51
            WIRE 528 352 560 352
        END BRANCH
        INSTANCE XLXI_25 304 384 R0
        INSTANCE XLXI_12 560 736 R0
        BEGIN BRANCH XLXN_52
            WIRE 528 480 560 480
        END BRANCH
        BEGIN BRANCH XLXN_53
            WIRE 528 544 560 544
        END BRANCH
        BEGIN BRANCH XLXN_54
            WIRE 528 608 560 608
        END BRANCH
        BEGIN BRANCH XLXN_55
            WIRE 528 672 560 672
        END BRANCH
        INSTANCE XLXI_26 304 704 R0
        INSTANCE XLXI_13 848 672 R0
        BEGIN BRANCH XLXN_10
            WIRE 816 512 832 512
            WIRE 832 512 832 544
            WIRE 832 544 848 544
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 816 640 832 640
            WIRE 832 608 848 608
            WIRE 832 608 832 640
        END BRANCH
        INSTANCE XLXI_14 848 352 R0
        BEGIN BRANCH XLXN_12
            WIRE 816 192 832 192
            WIRE 832 192 832 224
            WIRE 832 224 848 224
        END BRANCH
        BEGIN BRANCH XLXN_11
            WIRE 816 320 832 320
            WIRE 832 288 848 288
            WIRE 832 288 832 320
        END BRANCH
        INSTANCE XLXI_15 1136 512 R0
        BEGIN BRANCH XLXN_13
            WIRE 1104 256 1120 256
            WIRE 1120 256 1120 384
            WIRE 1120 384 1136 384
        END BRANCH
        BEGIN BRANCH XLXN_14
            WIRE 1104 576 1120 576
            WIRE 1120 448 1136 448
            WIRE 1120 448 1120 576
        END BRANCH
        BEGIN BRANCH sw_0
            WIRE 272 160 304 160
        END BRANCH
        IOMARKER 272 160 sw_0 R180 28
        BEGIN BRANCH sw_1
            WIRE 272 224 304 224
        END BRANCH
        IOMARKER 272 224 sw_1 R180 28
        BEGIN BRANCH sw_2
            WIRE 272 288 304 288
        END BRANCH
        IOMARKER 272 288 sw_2 R180 28
        BEGIN BRANCH sw_3
            WIRE 272 352 304 352
        END BRANCH
        IOMARKER 272 352 sw_3 R180 28
        BEGIN BRANCH sw_4
            WIRE 272 480 304 480
        END BRANCH
        IOMARKER 272 480 sw_4 R180 28
        BEGIN BRANCH sw_5
            WIRE 272 544 304 544
        END BRANCH
        IOMARKER 272 544 sw_5 R180 28
        BEGIN BRANCH sw_6
            WIRE 272 608 304 608
        END BRANCH
        IOMARKER 272 608 sw_6 R180 28
        BEGIN BRANCH sw_7
            WIRE 272 672 304 672
        END BRANCH
        IOMARKER 272 672 sw_7 R180 28
        INSTANCE XLXI_27 1872 304 R0
        INSTANCE XLXI_28 1872 624 R0
        INSTANCE XLXI_29 1872 944 R0
        BEGIN BRANCH XLXN_82
            WIRE 1728 176 1840 176
            WIRE 1840 176 1840 208
            WIRE 1840 208 1872 208
            WIRE 1840 144 1840 176
            WIRE 1840 144 1872 144
        END BRANCH
        INSTANCE XLXI_30 1504 208 R0
        BEGIN BRANCH XLXN_81
            WIRE 1392 416 1488 416
            WIRE 1488 416 1488 528
            WIRE 1488 528 1872 528
            WIRE 1488 176 1504 176
            WIRE 1488 176 1488 416
        END BRANCH
        INSTANCE XLXI_34 1488 448 R0
        BEGIN BRANCH XLXN_96
            WIRE 1552 272 1552 320
            WIRE 1552 272 1616 272
            WIRE 1616 272 1856 272
            WIRE 1856 272 1872 272
            WIRE 1856 272 1856 400
            WIRE 1856 400 1872 400
            WIRE 1856 400 1856 464
            WIRE 1856 464 1872 464
            WIRE 1616 272 1616 912
            WIRE 1616 912 1872 912
            WIRE 1856 80 1872 80
            WIRE 1856 80 1856 272
        END BRANCH
        INSTANCE XLXI_35 1776 656 R270
        BEGIN BRANCH XLXN_97
            WIRE 1776 592 1824 592
            WIRE 1824 592 1872 592
            WIRE 1824 592 1824 720
            WIRE 1824 720 1872 720
            WIRE 1824 720 1824 784
            WIRE 1824 784 1872 784
            WIRE 1824 784 1824 848
            WIRE 1824 848 1872 848
        END BRANCH
        BEGIN BRANCH led7_seg_A
            WIRE 2096 80 2128 80
        END BRANCH
        IOMARKER 2128 80 led7_seg_A R0 28
        BEGIN BRANCH led7_seg_B
            WIRE 2096 144 2128 144
        END BRANCH
        IOMARKER 2128 144 led7_seg_B R0 28
        BEGIN BRANCH led7_seg_C
            WIRE 2096 208 2128 208
        END BRANCH
        IOMARKER 2128 208 led7_seg_C R0 28
        BEGIN BRANCH led7_seg_D
            WIRE 2096 272 2128 272
        END BRANCH
        IOMARKER 2128 272 led7_seg_D R0 28
        BEGIN BRANCH led7_seg_E
            WIRE 2096 400 2128 400
        END BRANCH
        IOMARKER 2128 400 led7_seg_E R0 28
        BEGIN BRANCH led7_seg_F
            WIRE 2096 464 2128 464
        END BRANCH
        IOMARKER 2128 464 led7_seg_F R0 28
        BEGIN BRANCH led7_seg_G
            WIRE 2096 528 2128 528
        END BRANCH
        IOMARKER 2128 528 led7_seg_G R0 28
        BEGIN BRANCH led7_seg_DP
            WIRE 2096 592 2128 592
        END BRANCH
        IOMARKER 2128 592 led7_seg_DP R0 28
        BEGIN BRANCH led7_an_3
            WIRE 2096 720 2128 720
        END BRANCH
        IOMARKER 2128 720 led7_an_3 R0 28
        BEGIN BRANCH led7_an_2
            WIRE 2096 784 2128 784
        END BRANCH
        IOMARKER 2128 784 led7_an_2 R0 28
        BEGIN BRANCH led7_an_1
            WIRE 2096 848 2128 848
        END BRANCH
        IOMARKER 2128 848 led7_an_1 R0 28
        BEGIN BRANCH led7_an_0
            WIRE 2096 912 2128 912
        END BRANCH
        IOMARKER 2128 912 led7_an_0 R0 28
    END SHEET
END SCHEMATIC

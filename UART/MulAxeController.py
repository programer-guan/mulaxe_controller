# encoding=utf-8
__author__ = 'Guan'

import time
from tkinter import *
from serial import *
from time import sleep
from tkinter import ttk
from tkinter import scrolledtext        #导入滚动文本框的模块

import serial.tools.list_ports          #识别串口
import threading
import binascii

class GUI(Frame):                       #但习惯上会从Frame类派生出Gui类
    def __init__(self, master):         #为GUI编写构造函数__init_
        frame = Frame(master)
        frame.grid()
        # 串口号提示
        self.lab1 = Label(frame,text='Serial Number')#文字布局ipadx =20,ipady =20
        self.lab1.grid(row=0, column=0, sticky=W)    #显示窗口并使用grid布局  N/S/E/W:分别代表上对齐/下对齐/左对齐/右对齐
        # 串口号选择下拉菜单
        self.boxValue = StringVar()
        self.boxChoice = ttk.Combobox(frame, textvariable=self.boxValue, state='readonly', width=23)
        self.port_list = list(serial.tools.list_ports.comports())    #检测串口号
        self.boxChoice['value'] = [i[0] for i in self.port_list]
        #self.boxChoice['value'] = self.port_list
        self.boxChoice.current(0)
        self.boxChoice.bind('<<ComboboxSelected>>', self.Choice)
        self.boxChoice.grid(row=1, column=0,sticky=W)
        # 波特率选择提示
        self.lab2 = Label(frame, text='Baudrate Set')
        self.lab2.grid(row=2, column=0, sticky=W)
        # 波特率选择下拉菜单
        self.boxValueBaudrate = IntVar()
        self.BaudrateChoice = ttk.Combobox(frame,textvariable=self.boxValueBaudrate, state='readonly', width=23)
        self.BaudrateChoice['value'] = (9600,38400,115200)
        self.BaudrateChoice.current(0)
        self.BaudrateChoice.bind('<<ComboboxSelected>>', self.ChoiceBaudrate)
        self.BaudrateChoice.grid(row=3, column=0,sticky=W)
        # Message输出框提示
        self.Message = Label(frame, text='Message Show',)
        self.Message.grid(row=0, column=0,padx=175*x//1366,sticky=W)
        # Message输出框
        self.showMessage = scrolledtext.ScrolledText(frame, width=50, height=7,font = (u'仿宋',10), wrap=WORD)#带有滚动条的窗口
        self.showMessage.grid(row=1, column=0, rowspan=4, padx=175*x//1366, sticky=W)
        # error输出框提示
        self.laberror = Label(frame, text='Error Show',)
        self.laberror.grid(row=0, column=0, padx=573*x//1366, sticky=W)
        # error输出框
        self.showerror = scrolledtext.ScrolledText(frame, width=50, height=7,font = (u'仿宋',10), wrap=WORD)  # 带有滚动条的窗口
        self.showerror.grid(row=1, column=0, rowspan=4, padx=573*x//1366, sticky=W)
        # Clear按钮
        self.button2 = Button(frame, text='Clear', comman=self.clear)
        self.button2.grid(row=5, column=0, padx=888*x//1366, sticky=W)
        # 串口开启按钮
        self.button2 = Button(frame, text='Open Serial', command=self.open)
        self.button2.grid(row=5, column=0, sticky=W)
        # 串口关闭按钮
        self.button3 = Button(frame, text='Close Serial', command=self.close)
        self.button3.grid(row=5, column=0, padx=80*x//1366, sticky=W)
        # 串口信息提示
        self.showSerial = Text(frame, width=23, height=2, wrap=WORD)
        self.showSerial.grid(row=6, column=0, sticky=N + W)
        # 系统输入框提示
        self.lab5 = Label(frame, text='系统输入',font = (u'仿宋',11,"bold"))
        self.lab5.grid(row=8, column=0, sticky=W)
        # --------------------------------------CH0------------------------------------#
        # CH0输入框提示
        self.NCH0 = Label(frame, text='轴号-CH0',font = (u'仿宋',10,"bold"))
        self.NCH0.grid(row=9, column=0, sticky=W)
        self.status0 =IntVar()
        self.NCH0Checkbutton=Checkbutton(frame, width =2, bg="Snow",variable=self.status0)  # 给Checkbutton添加选中事件
        self.NCH0Checkbutton.grid(row=9, column=0, padx=65*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS0lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS0lab.grid(row=10, column=0, padx=0, sticky=W)
        # 启动频率输入框
        data_FS0 = StringVar()
        self.FS0input = Entry(frame, textvariable=data_FS0, width=7)
        data_FS0.set('1000')                                        # 输入框预设数值
        self.FS0input.grid(row=10, column=0, padx=64*x//1366, sticky=W)
        self.FS0lab = Label(frame, text='hz')
        self.FS0lab.grid(row=10, column=0, padx=112*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO0lab = Label(frame,  text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO0lab.grid(row=11, column=0, sticky=W)
        # 运行频率输入框
        data_FO0 = StringVar()
        self.FO0input = Entry(frame, textvariable=data_FO0, width=7)
        data_FO0.set('2000')
        self.FO0input.grid(row=11, column=0,padx=64*x//1366,sticky=W)
        self.FO0lab = Label(frame, text='hz')
        self.FO0lab.grid(row=11, column=0, padx=112*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np0lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np0lab.grid(row=12, column=0, sticky=W)
        # 脉冲数量输入框
        data_Np0 = StringVar()
        self.Np0input = Entry(frame, textvariable=data_Np0,  width=7)
        data_Np0.set('1000')
        self.Np0input.grid(row=12, column=0, padx=64*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx0lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx0lab.grid(row=13, column=0, sticky=W)
        # 加速时间输入框
        data_Ms0 = StringVar()
        self.kx0input = Entry(frame, textvariable=data_Ms0,  width=7)
        data_Ms0.set('255')
        self.kx0input.grid(row=13, column=0, padx=64*x//1366, sticky=W)
        self.Ms0lab = Label(frame, text='ms')
        self.Ms0lab.grid(row=13, column=0, padx=112*x//1366, sticky=W)
        # 启动输入按钮
        self.CH0button = Button(frame, text="设置",width=5, command=self.CH0_Serial)
        self.CH0button.grid(row=14, column=0, padx=64*x//1366, sticky=W)
        # --------------------------------------CH1------------------------------------#
        # CH1输入框提示
        self.NCH1 = Label(frame, text='轴号-CH1',font = (u'仿宋',10,"bold"))
        self.NCH1.grid(row=9, column=0, padx=150*x//1366, sticky=W)
        self.status1 = IntVar()
        self.NCH1Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status1)  # 给Checkbutton添加选中事件
        self.NCH1Checkbutton.grid(row=9, column=0, padx=216*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS1lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS1lab.grid(row=10, column=0, padx=150*x//1366, sticky=W)
        # 启动频率输入框
        data_FS1 = StringVar()
        self.FS1input = Entry(frame, textvariable=data_FS1, width=7)
        data_FS1.set('1000')
        self.FS1input.grid(row=10, column=0, padx=214*x//1366, sticky=W)
        self.FS1lab = Label(frame, text='hz')
        self.FS1lab.grid(row=10, column=0, padx=262*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO1lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO1lab.grid(row=11, column=0, padx=150*x//1366, sticky=W)
        # 运行频率输入框
        data_FO1 = StringVar()
        self.FO1input = Entry(frame, textvariable=data_FO1, width=7)
        data_FO1.set('2000')
        self.FO1input.grid(row=11, column=0, padx=214*x//1366, sticky=W)
        self.FO1lab = Label(frame, text='hz')
        self.FO1lab.grid(row=11, column=0, padx=262*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np1lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np1lab.grid(row=12, column=0, padx=150*x//1366, sticky=W)
        # 脉冲数量输入框
        data_Np1 = StringVar()
        self.Np1input = Entry(frame, textvariable=data_Np1,  width=7)
        data_Np1.set('1000')
        self.Np1input.grid(row=12, column=0, padx=214*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx1lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx1lab.grid(row=13, column=0, padx=150*x//1366, sticky=W)
        # 加速时间输入框
        data_Ms1 = StringVar()
        self.kx1input = Entry(frame, textvariable=data_Ms1,  width=7)
        data_Ms1.set('255')
        self.kx1input.grid(row=13, column=0, padx=214*x//1366, sticky=W)
        self.Ms1lab = Label(frame, text='ms')
        self.Ms1lab.grid(row=13, column=0, padx=262*x//1366, sticky=W)
        # 设置
        self.CH1button = Button(frame, text="设置", width=5, command=self.CH1_Serial)
        self.CH1button.grid(row=14, column=0, padx=214*x//1366, sticky=W)
        # --------------------------------------CH2------------------------------------#
        # CH2输入框提示
        self.NCH2 = Label(frame, text='轴号-CH2',font = (u'仿宋',10,"bold"))
        self.NCH2.grid(row=9, column=0, padx=303*x//1366, sticky=W)
        self.status2 = IntVar()
        self.NCH2Checkbutton = Checkbutton(frame, width=2,bg="Snow", variable=self.status2)  # 给Checkbutton添加选中事件
        self.NCH2Checkbutton.grid(row=9, column=0, padx=367*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS2lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS2lab.grid(row=10, column=0, padx=303*x//1366, sticky=W)
        # 启动频率输入框
        self.FS2input = Entry(frame,width=7)
        self.FS2input.grid(row=10, column=0, padx=365*x//1366, sticky=W)
        self.FS2lab = Label(frame, text='hz')
        self.FS2lab.grid(row=10, column=0, padx=413*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO2lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO2lab.grid(row=11, column=0, padx=303*x//1366, sticky=W)
        # 运行频率输入框
        self.FO2input = Entry(frame,width=7)
        self.FO2input.grid(row=11, column=0, padx=365*x//1366, sticky=W)
        self.FO2lab = Label(frame, text='hz')
        self.FO2lab.grid(row=11, column=0, padx=413*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np2lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np2lab.grid(row=12, column=0, padx=303*x//1366, sticky=W)
        # 脉冲数量输入框
        self.Np2input = Entry(frame,width=7)
        self.Np2input.grid(row=12, column=0, padx=365*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx2lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx2lab.grid(row=13, column=0, padx=303*x//1366, sticky=W)
        # 加速时间输入框
        self.kx2input = Entry(frame,width=7)
        self.kx2input.grid(row=13, column=0, padx=365*x//1366, sticky=W)
        self.Ms2lab = Label(frame, text='ms')
        self.Ms2lab.grid(row=13, column=0, padx=413*x//1366, sticky=W)
        # 设置
        self.CH2button = Button(frame, text="设置", width=5, command=self.CH2_Serial)
        self.CH2button.grid(row=14, column=0, padx=365*x//1366, sticky=W)
        # --------------------------------------CH3------------------------------------#
        # CH3输入框提示
        self.NCH3 = Label(frame, text='轴号-CH3',font = (u'仿宋',10,"bold"))
        self.NCH3.grid(row=9, column=0, padx=451*x//1366, sticky=W)
        self.status3 = IntVar()
        self.NCH3Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status3)  # 给Checkbutton添加选中事件
        self.NCH3Checkbutton.grid(row=9, column=0, padx=515*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS3lab = Label(frame,text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS3lab.grid(row=10, column=0, padx=451*x//1366, sticky=W)
        # 启动频率输入框
        self.FS3input = Entry(frame, width=7)
        self.FS3input.grid(row=10, column=0, padx=513*x//1366, sticky=W)
        self.FS3lab = Label(frame, text='hz')
        self.FS3lab.grid(row=10, column=0, padx=562*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO3lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO3lab.grid(row=11, column=0, padx=451*x//1366, sticky=W)
        # 运行频率输入框
        self.FO3input = Entry(frame, width=7)
        self.FO3input.grid(row=11, column=0, padx=513*x//1366, sticky=W)
        self.FO3lab = Label(frame, text='hz')
        self.FO3lab.grid(row=11, column=0, padx=562*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np3lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np3lab.grid(row=12, column=0, padx=451*x//1366, sticky=W)
        # 脉冲数量输入框
        self.Np3input = Entry(frame,width=7)
        self.Np3input.grid(row=12, column=0, padx=513*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx3lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx3lab.grid(row=13, column=0, padx=451*x//1366, sticky=W)
        # 加速时间输入框
        self.kx3input = Entry(frame, width=7)
        self.kx3input.grid(row=13, column=0, padx=513*x//1366, sticky=W)
        self.Ms3lab = Label(frame, text='ms')
        self.Ms3lab.grid(row=13, column=0, padx=562*x//1366, sticky=W)
        # 设置
        self.CH3button = Button(frame, text="设置", width=5, command=self.CH3_Serial)
        self.CH3button.grid(row=14, column=0, padx=513*x//1366, sticky=W)
        # --------------------------------------CH4------------------------------------#
        # CH4输入框提示
        self.NCH4 = Label(frame, text='轴号-CH4',font = (u'仿宋',10,"bold"))
        self.NCH4.grid(row=9, column=0, padx=592*x//1366, sticky=W)
        self.status4 = IntVar()
        self.NCH4Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status4)  # 给Checkbutton添加选中事件
        self.NCH4Checkbutton.grid(row=9, column=0, padx=656*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS4lab = Label(frame,text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS4lab.grid(row=10, column=0, padx=592*x//1366, sticky=W)
        # 启动频率输入框
        data_FS4 = StringVar()
        self.FS4input = Entry(frame, textvariable=data_FS4, width=7)
        data_FS4.set('1000')
        self.FS4input.grid(row=10, column=0, padx=654*x//1366, sticky=W)
        self.FS4lab = Label(frame, text='hz')
        self.FS4lab.grid(row=10, column=0, padx=702*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO4lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO4lab.grid(row=11, column=0, padx=592*x//1366, sticky=W)
        # 运行频率输入框
        data_FO4 = StringVar()
        self.FO4input = Entry(frame, textvariable=data_FO4, width=7)
        data_FO4.set('2000')
        self.FO4input.grid(row=11, column=0, padx=654*x//1366, sticky=W)
        self.FO4lab = Label(frame, text='hz')
        self.FO4lab.grid(row=11, column=0, padx=702*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np4lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np4lab.grid(row=12, column=0, padx=592*x//1366, sticky=W)
        # 脉冲数量输入框
        data_Np4 = StringVar()
        self.Np4input = Entry(frame, textvariable=data_Np4, width=7)
        data_Np4.set('1000')
        self.Np4input.grid(row=12, column=0, padx=654*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx4lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx4lab.grid(row=13, column=0, padx=592*x//1366, sticky=W)
        # 加速时间输入框
        data_Ms4 = StringVar()
        self.kx4input = Entry(frame, textvariable=data_Ms4, width=7)
        data_Ms4.set('255')
        self.kx4input.grid(row=13, column=0, padx=654*x//1366, sticky=W)
        self.Ms4lab = Label(frame, text='ms')
        self.Ms4lab.grid(row=13, column=0, padx=702*x//1366, sticky=W)
        # 设置
        self.CH4button = Button(frame, text="设置", width=5, command=self.CH4_Serial)
        self.CH4button.grid(row=14, column=0, padx=654*x//1366, sticky=W)
        # --------------------------------------CH5------------------------------------#
        # CH5输入框提示
        self.NCH5 = Label(frame, text='轴号-CH5',font = (u'仿宋',10,"bold"))
        self.NCH5.grid(row=9, column=0, padx=733*x//1366, sticky=W)
        self.status5 = IntVar()
        self.NCH5Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status5)  # 给Checkbutton添加选中事件
        self.NCH5Checkbutton.grid(row=9, column=0, padx=798*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS5lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS5lab.grid(row=10, column=0, padx=733*x//1366, sticky=W)
        # 启动频率输入框
        self.FS5input = Entry(frame, width=7)
        self.FS5input.grid(row=10, column=0, padx=796*x//1366, sticky=W)
        self.FS5lab = Label(frame, text='hz')
        self.FS5lab.grid(row=10, column=0, padx=845*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO5lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO5lab.grid(row=11, column=0, padx=733*x//1366, sticky=W)
        # 运行频率输入框
        self.FO5input = Entry(frame, width=7)
        self.FO5input.grid(row=11, column=0, padx=796*x//1366, sticky=W)
        self.FO5lab = Label(frame, text='hz')
        self.FO5lab.grid(row=11, column=0, padx=845*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np5lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np5lab.grid(row=12, column=0, padx=733*x//1366, sticky=W)
        # 脉冲数量输入框
        self.Np5input = Entry(frame, width=7)
        self.Np5input.grid(row=12, column=0, padx=796*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx5lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx5lab.grid(row=13, column=0, padx=733*x//1366, sticky=W)
        # 加速时间输入框
        self.kx5input = Entry(frame, width=7)
        self.kx5input.grid(row=13, column=0, padx=796*x//1366, sticky=W)
        self.Ms5lab = Label(frame, text='ms')
        self.Ms5lab.grid(row=13, column=0, padx=845*x//1366, sticky=W)
        # 设置
        self.CH5button = Button(frame, text="设置", width=5, command=self.CH5_Serial)
        self.CH5button.grid(row=14, column=0, padx=796*x//1366, sticky=W)
        # --------------------------------------CH6------------------------------------#
        # CH6输入框提示
        self.NCH6 = Label(frame, text='轴号-CH6',font = (u'仿宋',10,"bold"))
        self.NCH6.grid(row=9, column=0, padx=873*x//1366, sticky=W)
        self.status6 = IntVar()
        self.NCH6Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status6)  # 给Checkbutton添加选中事件
        self.NCH6Checkbutton.grid(row=9, column=0, padx=940*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS6lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS6lab.grid(row=10, column=0, padx=873*x//1366, sticky=W)
        # 启动频率输入框
        self.FS6input = Entry(frame, width=7)
        self.FS6input.grid(row=10, column=0, padx=938*x//1366, sticky=W)
        self.FS6lab = Label(frame, text='hz')
        self.FS6lab.grid(row=10, column=0, padx=987*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO6lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO6lab.grid(row=11, column=0, padx=873*x//1366, sticky=W)
        # 运行频率输入框
        self.FO6input = Entry(frame, width=7)
        self.FO6input.grid(row=11, column=0, padx=938*x//1366, sticky=W)
        self.FO6lab = Label(frame, text='hz')
        self.FO6lab.grid(row=11, column=0, padx=987*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np6lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np6lab.grid(row=12, column=0, padx=873*x//1366, sticky=W)
        # 脉冲数量输入框
        self.Np6input = Entry(frame, width=7)
        self.Np6input.grid(row=12, column=0, padx=938*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx6lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx6lab.grid(row=13, column=0, padx=873*x//1366, sticky=W)
        # 加速时间输入框
        self.kx6input = Entry(frame, width=7)
        self.kx6input.grid(row=13, column=0, padx=938*x//1366, sticky=W)
        self.Ms6lab = Label(frame, text='ms')
        self.Ms6lab.grid(row=13, column=0, padx=985*x//1366, sticky=W)
        # 设置
        self.CH6button = Button(frame, text="设置", width=5, command=self.CH6_Serial)
        self.CH6button.grid(row=14, column=0, padx=937*x//1366, sticky=W)
        # --------------------------------------CH7------------------------------------#
        # CH7输入框提示
        self.NCH7 = Label(frame, text='轴号-CH7',font = (u'仿宋',10,"bold"))
        self.NCH7.grid(row=15, column=0, sticky=W)
        self.status7 = IntVar()
        self.NCH7Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status7)  # 给Checkbutton添加选中事件
        self.NCH7Checkbutton.grid(row=15, column=0, padx=65*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS7lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS7lab.grid(row=16, column=0, padx=0, sticky=W)
        # 启动频率输入框
        self.FS7input = Entry(frame, width=7)
        self.FS7input.grid(row=16, column=0, padx=64*x//1366, sticky=W)
        self.FS7lab = Label(frame, text='hz')
        self.FS7lab.grid(row=16, column=0, padx=112*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO7lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO7lab.grid(row=17, column=0,  sticky=W)
        # 运行频率输入框
        self.FO7input = Entry(frame, width=7)
        self.FO7input.grid(row=17, column=0, padx=64*x//1366, sticky=W)
        self.FO7lab = Label(frame, text='hz')
        self.FO7lab.grid(row=17, column=0, padx=112*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np7lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np7lab.grid(row=18, column=0, padx=0, sticky=W)
        # 脉冲数量输入框
        self.Np7input = Entry(frame, width=7)
        self.Np7input.grid(row=18, column=0, padx=64*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx7lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx7lab.grid(row=19, column=0, padx=0, sticky=W)
        # 加速时间输入框
        self.kx7input = Entry(frame, width=7)
        self.kx7input.grid(row=19, column=0, padx=64*x//1366, sticky=W)
        self.Ms7lab = Label(frame, text='ms')
        self.Ms7lab.grid(row=19, column=0, padx=112*x//1366, sticky=W)
        # 设置
        self.CH7button = Button(frame, text="设置", width=5, command=self.CH7_Serial)
        self.CH7button.grid(row=20, column=0, padx=64*x//1366, sticky=W)
        # --------------------------------------CH8------------------------------------#
        # CH8输入框提示
        self.NCH8 = Label(frame, text='轴号-CH8',font = (u'仿宋',10,"bold"))
        self.NCH8.grid(row=15, column=0, padx=150*x//1366, sticky=W)
        self.status8 = IntVar()
        self.NCH8Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status8)  # 给Checkbutton添加选中事件
        self.NCH8Checkbutton.grid(row=15, column=0, padx=216*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS8lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS8lab.grid(row=16, column=0, padx=150*x//1366, sticky=W)
        # 启动频率输入框
        self.FS8input = Entry(frame, width=7)
        self.FS8input.grid(row=16, column=0, padx=214*x//1366, sticky=W)
        self.FS8lab = Label(frame, text='hz')
        self.FS8lab.grid(row=16, column=0, padx=264*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO8lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO8lab.grid(row=17, column=0, padx=150*x//1366, sticky=W)
        # 运行频率输入框
        self.FO8input = Entry(frame, width=7)
        self.FO8input.grid(row=17, column=0, padx=214*x//1366, sticky=W)
        self.FO8lab = Label(frame, text='hz')
        self.FO8lab.grid(row=17, column=0, padx=264*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np8lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np8lab.grid(row=18, column=0, padx=150*x//1366, sticky=W)
        # 脉冲数量输入框
        self.Np8input = Entry(frame, width=7)
        self.Np8input.grid(row=18, column=0, padx=214*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx8lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx8lab.grid(row=19, column=0, padx=150*x//1366, sticky=W)
        # 加速时间输入框
        self.kx8input = Entry(frame, width=7)
        self.kx8input.grid(row=19, column=0, padx=214*x//1366, sticky=W)
        self.Ms8lab = Label(frame, text='ms')
        self.Ms8lab.grid(row=19, column=0, padx=264*x//1366, sticky=W)
        # 设置
        self.CH8button = Button(frame, text="设置", width=5, command=self.CH8_Serial)
        self.CH8button.grid(row=20, column=0, padx=214*x//1366, sticky=W)
        # --------------------------------------CH9------------------------------------#
        # CH9输入框提示
        self.NCH9 = Label(frame, text='轴号-CH9',font = (u'仿宋',10,"bold"))
        self.NCH9.grid(row=15, column=0, padx=303*x//1366, sticky=W)
        self.status9 = IntVar()
        self.NCH9Checkbutton = Checkbutton(frame, width=2, bg="Snow", variable=self.status9)  # 给Checkbutton添加选中事件
        self.NCH9Checkbutton.grid(row=15, column=0, padx=367*x//1366, sticky=W)
        # 启动频率输入框提示
        self.FS9lab = Label(frame, text='启动频率',font = (u'仿宋',10,"bold"))
        self.FS9lab.grid(row=16, column=0, padx=303*x//1366, sticky=W)
        # 启动频率输入框
        self.FS9input = Entry(frame, width=7)
        self.FS9input.grid(row=16, column=0, padx=365*x//1366, sticky=W)
        self.FS9lab = Label(frame, text='hz')
        self.FS9lab.grid(row=16, column=0, padx=412*x//1366, sticky=W)
        # 运行频率输入框提示
        self.FO9lab = Label(frame, text='运行频率',font = (u'仿宋',10,"bold"))
        self.FO9lab.grid(row=17, column=0, padx=303*x//1366, sticky=W)
        # 运行频率输入框
        self.FO9input = Entry(frame, width=7)
        self.FO9input.grid(row=17, column=0, padx=365*x//1366, sticky=W)
        self.FO9lab = Label(frame, text='hz')
        self.FO9lab.grid(row=17, column=0, padx=412*x//1366, sticky=W)
        # 脉冲数量输入框提示
        self.Np9lab = Label(frame, text='脉冲数量',font = (u'仿宋',10,"bold"))
        self.Np9lab.grid(row=18, column=0, padx=303*x//1366, sticky=W)
        # 脉冲数量输入框
        self.Np9input = Entry(frame, width=7)
        self.Np9input.grid(row=18, column=0, padx=365*x//1366, sticky=W)
        # 加速时间输入框提示
        self.Kx9lab = Label(frame, text='加速时间',font = (u'仿宋',10,"bold"))
        self.Kx9lab.grid(row=19, column=0, padx=303*x//1366, sticky=W)
        # 加速时间输入框
        self.kx9input = Entry(frame, width=7)
        self.kx9input.grid(row=19, column=0, padx=365*x//1366, sticky=W)
        self.Ms9lab = Label(frame, text='ms')
        self.Ms9lab.grid(row=19, column=0, padx=412*x//1366, sticky=W)
        # 设置
        self.CH9button = Button(frame, text="设置", width=5, command=self.CH9_Serial)
        self.CH9button.grid(row=20, column=0, padx=365*x//1366, sticky=W)
        # --------------------------------------CHN------------------------------------#
        # 启动输入按钮
        self.button4 = Button(frame, text="启 动", font = (u'仿宋',11,"bold"), width=10, command=self.Trun_On)
        self.button4.grid(row=20, column=0, padx=918*x//1366, sticky=W)

        # 系统输出框提示
        self.lab6 = Label(frame, text='系统输出',font = (u'仿宋',11,"bold"))
        self.lab6.grid(row=22, column=0, sticky=W)
        # CH0输出框提示
        self.CH0lab = Label(frame, text='CH0')
        self.CH0lab.grid(row=23, column=0, sticky=W)
        # CH0输出
        self.CH0show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH0show.grid(row=23, column=0, padx=30*x//1366, sticky=W)
        # CH0左限位提示
        self.CH0llab = Label(frame,font = (u'仿宋',10,"bold"),text='左限位')
        self.CH0llab.grid(row=23, column=0,padx=50*x//1366, sticky=W)
        # CH0左限位输出
        self.CH0lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH0lNp.grid(row=23, column=0, padx=95*x//1366,sticky=W)
        # CH0右限位提示
        self.CH0rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH0rlab.grid(row=23, column=0, padx=120*x//1366, sticky=W)
        # CH0右限位输出
        self.CH0rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH0rNp.grid(row=23, column=0, padx=165*x//1366, sticky=W)
        # CH1输出框提示
        self.CH1lab = Label(frame, text='CH1')
        self.CH1lab.grid(row=23, column=0, padx=230*x//1366, sticky=W)
        # CH1输出
        self.CH1show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH1show.grid(row=23, column=0, padx=260*x//1366, sticky=W)
        # CH1左限位输出框提示
        self.CH1llab = Label(frame,font = (u'仿宋',10,"bold"),text='左限位')
        self.CH1llab.grid(row=23, column=0, padx=280*x//1366, sticky=W)
        # CH1左限位输出
        self.CH1lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH1lNp.grid(row=23, column=0, padx=325*x//1366, sticky=W)
        # CH1右限位输出框提示
        self.CH1rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH1rlab.grid(row=23, column=0, padx=350*x//1366, sticky=W)
        # CH1右限位输出
        self.CH1rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH1rNp.grid(row=23, column=0, padx=395*x//1366, sticky=W)
        # CH2输出框提示
        self.CH2lab = Label(frame, text='CH2')
        self.CH2lab.grid(row=23, column=0, padx=460*x//1366, sticky=W)
        # CH2输出
        self.CH2show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH2show.grid(row=23, column=0, padx=490*x//1366, sticky=W)
        # CH2左限位输出框提示
        self.CH2lab = Label(frame,font = (u'仿宋',10,"bold"),text='左限位')
        self.CH2lab.grid(row=23, column=0, padx=510*x//1366, sticky=W)
        # CH2左限位输出
        self.CH2lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH2lNp.grid(row=23, column=0, padx=555*x//1366, sticky=W)
        # CH2右限位输出框提示
        self.CH2rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH2rlab.grid(row=23, column=0, padx=580*x//1366, sticky=W)
        # CH2右限位输出
        self.CH2rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH2rNp.grid(row=23, column=0, padx=625*x//1366, sticky=W)
        # CH3输出框提示
        self.CH3lab = Label(frame, text='CH3')
        self.CH3lab.grid(row=23, column=0, padx=690*x//1366, sticky=W)
        # CH3输出
        self.CH3show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH3show.grid(row=23, column=0, padx=720*x//1366, sticky=W)
        # CH3左限位输出框提示
        self.CH3llab = Label(frame,font = (u'仿宋',10,"bold"),text='左限位')
        self.CH3llab.grid(row=23, column=0, padx=740*x//1366, sticky=W)
        # CH3左限位输出
        self.CH3lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH3lNp.grid(row=23, column=0, padx=785*x//1366, sticky=W)
        # CH3左限位输出框提示
        self.CH3rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH3rlab.grid(row=23, column=0, padx=810*x//1366, sticky=W)
        # CH3左限位输出
        self.CH3rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH3rNp.grid(row=23, column=0, padx=855*x//1366, sticky=W)
        # CH4输出框提示
        self.CH4lab = Label(frame, text='CH4')
        self.CH4lab.grid(row=24, column=0, sticky=W)
        # CH4输出
        self.CH4show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH4show.grid(row=24, column=0, padx=30*x//1366, sticky=W)
        # CH4左限位提示
        self.CH4llab = Label(frame, font=(u'仿宋', 10, "bold"), text='左限位')
        self.CH4llab.grid(row=24, column=0, padx=50*x//1366, sticky=W)
        # CH4左限位输出
        self.CH4lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH4lNp.grid(row=24, column=0, padx=95*x//1366, sticky=W)
        # CH4右限位提示
        self.CH4rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH4rlab.grid(row=24, column=0, padx=120*x//1366, sticky=W)
        # CH4右限位输出
        self.CH4rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH4rNp.grid(row=24, column=0, padx=165*x//1366, sticky=W)
        # CH5输出框提示
        self.CH5lab = Label(frame, text='CH5')
        self.CH5lab.grid(row=24, column=0, padx=230*x//1366, sticky=W)
        # CH5输出
        self.CH5show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH5show.grid(row=24, column=0, padx=260*x//1366, sticky=W)
        # CH5左限位输出框提示
        self.CH5llab = Label(frame, font=(u'仿宋', 10, "bold"), text='左限位')
        self.CH5llab.grid(row=24, column=0, padx=280*x//1366, sticky=W)
        # CH5左限位输出
        self.CH5lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH5lNp.grid(row=24, column=0, padx=325*x//1366, sticky=W)
        # CH5右限位输出框提示
        self.CH5rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH5rlab.grid(row=24, column=0, padx=350*x//1366, sticky=W)
        # CH5右限位输出
        self.CH5rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH5rNp.grid(row=24, column=0, padx=395*x//1366, sticky=W)
        # CH6输出框提示
        self.CH6lab = Label(frame, text='CH6')
        self.CH6lab.grid(row=24, column=0, padx=460*x//1366, sticky=W)
        # CH6输出
        self.CH6show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH6show.grid(row=24, column=0, padx=490*x//1366, sticky=W)
        # CH6左限位输出框提示
        self.CH6llab = Label(frame, font=(u'仿宋', 10, "bold"), text='左限位')
        self.CH6llab.grid(row=24, column=0, padx=510*x//1366, sticky=W)
        # CH6左限位输出
        self.CH6lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH6lNp.grid(row=24, column=0, padx=555*x//1366, sticky=W)
        # CH6右限位输出框提示
        self.CH6rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH6rlab.grid(row=24, column=0, padx=580*x//1366, sticky=W)
        # CH6右限位输出
        self.CH6rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH6rNp.grid(row=24, column=0, padx=625*x//1366, sticky=W)
        # CH7输出框提示
        self.CH7lab = Label(frame, text='CH7')
        self.CH7lab.grid(row=24, column=0, padx=690*x//1366, sticky=W)
        # CH7输出
        self.CH7show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH7show.grid(row=24, column=0, padx=720*x//1366, sticky=W)
        # CH7左限位输出框提示
        self.CH7llab = Label(frame, font=(u'仿宋', 10, "bold"), text='左限位')
        self.CH7llab.grid(row=24, column=0, padx=740*x//1366, sticky=W)
        # CH7左限位输出
        self.CH7lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH7lNp.grid(row=24, column=0, padx=785*x//1366, sticky=W)
        # CH7右限位输出框提示
        self.CH7rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH7rlab.grid(row=24, column=0, padx=810*x//1366, sticky=W)
        # CH7右限位输出
        self.CH7rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH7rNp.grid(row=24, column=0, padx=855*x//1366, sticky=W)
        # CH8输出框提示
        self.CH8lab = Label(frame, text='CH8')
        self.CH8lab.grid(row=25, column=0, sticky=W)
        # CH8输出
        self.CH8show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH8show.grid(row=25, column=0, padx=30*x//1366, sticky=W)
        # CH8左限位提示
        self.CH8llab = Label(frame, font=(u'仿宋', 10, "bold"), text='左限位')
        self.CH8llab.grid(row=25, column=0, padx=50*x//1366, sticky=W)
        # CH8左限位输出
        self.CH8lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH8lNp.grid(row=25, column=0, padx=95*x//1366, sticky=W)
        # CH8右限位提示
        self.CH8rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH8rlab.grid(row=25, column=0, padx=120*x//1366, sticky=W)
        # CH8右限位输出
        self.CH8rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH8rNp.grid(row=25, column=0, padx=165*x//1366, sticky=W)
        # CH9输出框提示
        self.CH9lab = Label(frame, text='CH9')
        self.CH9lab.grid(row=25, column=0, padx=230*x//1366, sticky=W)
        # CH9输出
        self.CH9show = Text(frame, width=2, height=1, wrap=WORD)
        self.CH9show.grid(row=25, column=0, padx=260*x//1366, sticky=W)
        # CH9左限位输出框提示
        self.CH9llab = Label(frame, font=(u'仿宋', 10, "bold"), text='左限位')
        self.CH9llab.grid(row=25, column=0, padx=280*x//1366, sticky=W)
        # CH9左限位输出
        self.CH9lNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH9lNp.grid(row=25, column=0, padx=325*x//1366, sticky=W)
        # CH9右限位输出框提示
        self.CH9rlab = Label(frame, font=(u'仿宋', 10, "bold"), text='右限位')
        self.CH9rlab.grid(row=25, column=0, padx=350*x//1366, sticky=W)
        # CH9右限位输出
        self.CH9rNp = Text(frame, width=2, height=1, wrap=WORD)
        self.CH9rNp.grid(row=25, column=0, padx=395*x//1366, sticky=W)

        # --------------------------------------Order------------------------------------#
        # 输入框提示
        self.lab4 = Label(frame, text='Input here,please![hex]')
        self.lab4.grid(row=27, column=0, padx=0, sticky=W)
        # CH0命令输入框
        data0 = StringVar()
        self.input0 = Entry(frame, textvariable=data0, width=34)
        data0.set('CD 00 03 E8 00 07 D0 00 00 03 56 00 FF')         # 输入框预设数值
        self.input0.grid(row=28, column=0, padx=0, sticky=W + N + S)
        # CH0命令输入按钮
        self.CH0button = Button(frame, text="Input0",font = (u'仿宋',10,"bold"), width=5, command=self.CH0_Submit)
        self.CH0button.grid(row=28, column=0, padx=210*x//1366, sticky=W)
        # CH1命令输入框
        data1 = StringVar()
        self.input1 = Entry(frame, textvariable=data1, width=34)
        data1.set('CD 01 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input1.grid(row=28, column=0, padx=285*x//1366, sticky=W + N + S)
        # CH1命令输入按钮
        self.CH1button = Button(frame, text="Input1",font = (u'仿宋',10,"bold"), width=5, command=self.CH1_Submit)
        self.CH1button.grid(row=28, column=0, padx=496*x//1366, sticky=W)
        # CH2命令输入框
        data2 = StringVar()
        self.input2 = Entry(frame, textvariable=data2, width=34)
        data2.set('CD 02 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input2.grid(row=28, column=0, padx=565*x//1366, sticky=W + N + S)
        # CH2命令输入按钮
        self.CH2button = Button(frame, text="Input2",font = (u'仿宋',10,"bold"), width=5, command=self.CH2_Submit)
        self.CH2button.grid(row=28, column=0, padx=776*x//1366, sticky=W)
        # CH3命令输入框
        data3 = StringVar()
        self.input3 = Entry(frame, textvariable=data3, width=34)
        data3.set('CD 03 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input3.grid(row=29, column=0, padx=0, sticky=W + N + S)
        # CH3命令输入按钮
        self.CH3button = Button(frame, text="Input3", font = (u'仿宋',10,"bold"), width=5,command=self.CH3_Submit)
        self.CH3button.grid(row=29, column=0, padx=210*x//1366, sticky=W)
        # CH4命令输入框
        data4 = StringVar()
        self.input4 = Entry(frame, textvariable=data4, width=34)
        data4.set('CD 04 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input4.grid(row=29, column=0, padx=285*x//1366, sticky=W + N + S)
        # CH4命令输入按钮
        self.CH4button1 = Button(frame, text="Input4",font = (u'仿宋',10,"bold"), width=5, command=self.CH4_Submit)
        self.CH4button1.grid(row=29, column=0, padx=496*x//1366, sticky=W)
        # CH5命令输入框
        data5 = StringVar()
        self.input5 = Entry(frame, textvariable=data5, width=34)
        data5.set('CD 05 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input5.grid(row=29, column=0, padx=565*x//1366, sticky=W + N + S)
        # CH5命令输入按钮
        self.CH5button = Button(frame, text="Input5",font = (u'仿宋',10,"bold"), width=5, command=self.CH5_Submit)
        self.CH5button.grid(row=29, column=0, padx=776*x//1366, sticky=W)
        # CH6命令输入框
        data6 = StringVar()
        self.input6 = Entry(frame, textvariable=data6, width=34)
        data6.set('CD 06 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input6.grid(row=30, column=0, padx=0, sticky=W + N + S)
        # CH6命令输入按钮
        self.CH6button = Button(frame, text="Input6", font = (u'仿宋',10,"bold"), width=5,command=self.CH6_Submit)
        self.CH6button.grid(row=30, column=0, padx=210*x//1366, sticky=W)
        # CH7命令输入框
        data7 = StringVar()
        self.input7 = Entry(frame, textvariable=data7, width=34)
        data7.set('CD 07 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input7.grid(row=30, column=0, padx=285*x//1366, sticky=W + N + S)
        # CH7命令输入按钮
        self.CH7button = Button(frame, text="Input7",font = (u'仿宋',10,"bold"), width=5, command=self.CH7_Submit)
        self.CH7button.grid(row=30, column=0, padx=496*x//1366, sticky=W)
        # CH8命令输入框
        data8 = StringVar()
        self.input8 = Entry(frame, textvariable=data8, width=34)
        data8.set('CD 08 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input8.grid(row=30, column=0, padx=565*x//1366, sticky=W + N + S)
        # CH8命令输入按钮
        self.CH8button = Button(frame, text="Input8", font = (u'仿宋',10,"bold"), width=5, command=self.CH8_Submit)
        self.CH8button.grid(row=30, column=0, padx=776*x//1366, sticky=W)
        # CH9命令输入框
        data9 = StringVar()
        self.input9 = Entry(frame, textvariable=data9, width=34)
        data9.set('CD 09 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.input9.grid(row=31, column=0, padx=0, sticky=W + N + S)
        # CH9命令输入按钮
        self.CH9button = Button(frame, text="Input9", font = (u'仿宋',10,"bold"), width=5, command=self.CH9_Submit)
        self.CH9button.grid(row=31, column=0, padx=210*x//1366, sticky=W)
        # CHA命令输入框
        dataA = StringVar()
        self.inputA = Entry(frame, textvariable=dataA, width=34)
        dataA.set('CD 0A 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputA.grid(row=31, column=0, padx=285*x//1366, sticky=W + N + S)
        # CHA命令输入按钮
        self.CHAbutton = Button(frame, text="InputA", font=(u'仿宋', 10, "bold"), width=5, command=self.CHA_Submit)
        self.CHAbutton.grid(row=31, column=0, padx=496*x//1366, sticky=W + N + S)
        # CHB命令输入框
        dataB = StringVar()
        self.inputB = Entry(frame, textvariable=dataB, width=34)
        dataB.set('CD 0B 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputB.grid(row=31, column=0, padx=565*x//1366, sticky=W + N + S)
        # CHB命令输入按钮
        self.CHBbutton = Button(frame, text="InputB", font=(u'仿宋', 10, "bold"), width=5, command=self.CHB_Submit)
        self.CHBbutton.grid(row=31, column=0, padx=776*x//1366, sticky=W)
        # CHC命令输入框
        dataC = StringVar()
        self.inputC = Entry(frame, textvariable=dataC, width=34)
        dataC.set('CD 0C 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputC.grid(row=32, column=0, padx=0, sticky=W + N + S)
        # CHC命令输入按钮
        self.CHCbutton = Button(frame, text="InputC", font=(u'仿宋', 10, "bold"), width=5, command=self.CHC_Submit)
        self.CHCbutton.grid(row=32, column=0, padx=210*x//1366, sticky=W)
        # CHD命令输入框
        dataD = StringVar()
        self.inputD = Entry(frame, textvariable=dataD, width=34)
        dataD.set('CD 0D 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputD.grid(row=32, column=0, padx=285*x//1366, sticky=W + N + S)
        # CHD命令输入按钮
        self.CHDbutton = Button(frame, text="InputD", font=(u'仿宋', 10, "bold"), width=5, command=self.CHD_Submit)
        self.CHDbutton.grid(row=32, column=0, padx=496*x//1366, sticky=W + N + S)
        # CHE命令输入框
        dataE = StringVar()
        self.inputE = Entry(frame, textvariable=dataE, width=34)
        dataE.set('CD 0E 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputE.grid(row=32, column=0, padx=565*x//1366, sticky=W + N + S)
        # CHE命令输入按钮
        self.CHEbutton = Button(frame, text="InputE", font=(u'仿宋', 10, "bold"), width=5, command=self.CHE_Submit)
        self.CHEbutton.grid(row=32, column=0, padx=776*x//1366, sticky=W)
        # CHF命令输入框
        dataF = StringVar()
        self.inputF = Entry(frame, textvariable=dataF, width=34)
        dataF.set('CD 0F 03 E8 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputF.grid(row=33, column=0, padx=0, sticky=W + N + S)
        # CHF命令输入按钮
        self.CHFbutton = Button(frame, text="InputF", font=(u'仿宋', 10, "bold"), width=5, command=self.CHF_Submit)
        self.CHFbutton.grid(row=33, column=0, padx=210*x//1366, sticky=W)

        # Go命令输入框
        dataGo= StringVar()
        self.inputGo = Entry(frame, textvariable=dataGo, width=34)
        dataGo.set('EB FF FF 01 00 07 D0 00 00 03 56 00 FF')  # 输入框预设数值
        self.inputGo.grid(row=33, column=0, padx=565*x//1366, sticky=W + N + S)
        # Go命令输入按钮
        self.Gobutton = Button(frame, text="Go", font = (u'仿宋',11,"bold"), width=10, command=self.Go_Submit)
        self.Gobutton.grid(row=33, column=0, padx=776*x//1366, sticky=W)
        # 串口初始化配置
        self.ser = Serial()

    def Choice(self, event):
        context = self.boxValue.get()
        self.ser.port = context
        print(self.ser.port)

    def ChoiceBaudrate(self, event):
        self.baudrate = self.boxValueBaudrate.get()
        self.ser.baudrate = self.baudrate       #Python3以上版本不兼容
        print(self.baudrate)

    def CH0_Submit(self):
        senddata = self.input0.get()
        print(senddata)
        # CD 00 03 E8 00 07 D0 00 00 03 56 00 FF
        senddata1 = senddata.split( )                  #  删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)                 #  list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        print(senddata2)

        print(binascii.a2b_hex(senddata2))
        n = self.ser.write(binascii.a2b_hex(senddata2))   #将字符按照十六进制格式发送 N为发送字符数目
        print(n)

    def CH1_Submit(self):
        senddata = self.input1.get()
        senddata1 = senddata.split( )                  #  删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)                 #  list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH2_Submit(self):
        senddata = self.input2.get()
        senddata1 = senddata.split( )                  #  删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)                 #  list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH3_Submit(self):
        senddata = self.input3.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH4_Submit(self):
        senddata = self.input4.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH5_Submit(self):
        senddata = self.input5.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH6_Submit(self):
        senddata = self.input6.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH7_Submit(self):
        senddata = self.input7.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH8_Submit(self):
        senddata = self.input8.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CH9_Submit(self):
        senddata = self.input9.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CHA_Submit(self):
        senddata = self.inputA.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CHB_Submit(self):
        senddata = self.inputB.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CHC_Submit(self):
        senddata = self.inputC.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CHD_Submit(self):
        senddata = self.inputD.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CHE_Submit(self):
        senddata = self.inputE.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def CHF_Submit(self):
        senddata = self.inputF.get()
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))

    def Go_Submit(self):
        senddata = self.inputGo.get()
        print(senddata)
        senddata1 = senddata.split()  # 删除所有空格转换为list模式
        senddata2 = ''.join(senddata1)  # list——> str  str = ''.join(list名)     str——>list   list = list(str名)
        self.ser.write(binascii.a2b_hex(senddata2))
        print(binascii.a2b_hex(senddata2))

    def clear(self):
        self.showerror.delete(0.0, END)     # 清空输出框用来刷新输出数据
        self.showMessage.delete(0.0, END)   # 清空输出框用来刷新输出数据

    def CH0_Serial(self):
        FS0 = int(self.FS0input.get())  # 16bit数据
        FO0 = int(self.FO0input.get())  # 24bit数据
        Np0 = int(self.Np0input.get())  # 32bit数据
        Ms0 = int(self.kx0input.get())  # 16bit数据

        FS0H = (FS0 & 0xff00) >> 8
        FS0L =  FS0 & 0xff

        FO03 = (FO0 & 0xff0000) >> 16
        FO02 = (FO0 & 0xff00) >> 8
        FO01 =  FO0 & 0xff

        Np04 = (Np0 & 0xff000000) >> 24
        Np03 = (Np0 & 0xff0000) >> 16
        Np02 = (Np0 & 0xff00) >> 8
        Np01 =  Np0 & 0xff

        Ms0H = (Ms0 & 0xff00) >> 8
        Ms0L =  Ms0 & 0xff

        CH0_context = [0xcd, 0x00, FS0H, FS0L, FO03, FO02, FO01, Np04, Np03, Np02, Np01, Ms0H, Ms0L]

        self.ser.write(CH0_context)
        self.showMessage.insert(0.0, '-CH0 通道已设置-')

        n0 = (FO0-FS0)//Ms0           #频率增加系数
        print(CH0_context)
        if n0 < 0:
            self.showerror.insert(0.0, '-CH0参数设置有误-')
        if Ms0 >65536:
            self.showerror.insert(0.0, '-CH0加速时间超过16bit-')

    def CH1_Serial(self):
        FS1 = int(self.FS1input.get())  # 16bit数据
        FO1 = int(self.FO1input.get())  # 24bit数据
        Np1 = int(self.Np1input.get())  # 32bit数据
        Ms1 = int(self.kx1input.get())  # 16bit数据

        FS1H = (FS1 & 0xff00) >> 8
        FS1L =  FS1 & 0xff

        FO13 = (FO1 & 0xff0000) >> 16
        FO12 = (FO1 & 0xff00) >> 8
        FO11 =  FO1 & 0xff

        Np14 = (Np1 & 0xff000000) >> 24
        Np13 = (Np1 & 0xff0000) >> 16
        Np12 = (Np1 & 0xff00) >> 8
        Np11 =  Np1 & 0xff

        Ms1H = (Ms1 & 0xff00) >> 8
        Ms1L =  Ms1 & 0xff

        CH1_context = [0xcd, 0x01, FS1H, FS1L, FO13, FO12, FO11, Np14, Np13, Np12, Np11, Ms1H, Ms1L]
        self.ser.write(CH1_context)
        self.showMessage.insert(0.0, '-CH1 通道已设置-')

        n1 = (FO1 - FS1) // Ms1  # 频率增加系数
        if n1 < 0:
            self.showerror.insert(0.0, '-CH1参数设置有误-')
        if Ms1 >65536:
            self.showerror.insert(0.0, '-CH1加速时间超过16bit-')

    def CH2_Serial(self):
        FS2 = int(self.FS2input.get())  # 16bit数据
        FO2 = int(self.FO2input.get())  # 24bit数据
        Np2 = int(self.Np2input.get())  # 32bit数据
        Ms2 = int(self.kx2input.get())  # 16bit数据

        FS2H = (FS2 & 0xff00) >> 8
        FS2L =  FS2 & 0xff

        FO23 = (FO2 & 0xff0000) >> 16
        FO22 = (FO2 & 0xff00) >> 8
        FO21 =  FO2 & 0xff

        Np24 = (Np2 & 0xff000000) >> 24
        Np23 = (Np2 & 0xff0000) >> 16
        Np22 = (Np2 & 0xff00) >> 8
        Np21 =  Np2 & 0xff

        Ms2H = (Ms2 & 0xff00) >> 8
        Ms2L =  Ms2 & 0xff

        CH2_context = [0xcd, 0x02, FS2H, FS2L, FO23, FO22, FO21, Np24, Np23, Np22, Np21, Ms2H, Ms2L]
        self.ser.write(CH2_context)
        self.showMessage.insert(0.0, '-CH2 通道已设置-')

        n2 = (FO2 - FS2) // Ms2  # 频率增加系数
        if n2 < 0:
            self.showerror.insert(0.0, '-CH2参数设置有误-')
        if Ms2 >65536:
            self.showerror.insert(0.0, '-CH2加速时间超过16bit-')
    def CH3_Serial(self):
        FS3 = int(self.FS3input.get())  # 16bit数据
        FO3 = int(self.FO3input.get())  # 24bit数据
        Np3 = int(self.Np3input.get())  # 32bit数据
        Ms3 = int(self.kx3input.get())  # 16bit数据

        FS3H = (FS3 & 0xff00) >> 8
        FS3L =  FS3 & 0xff

        FO33 = (FO3 & 0xff0000) >> 16
        FO32 = (FO3 & 0xff00) >> 8
        FO31 =  FO3 & 0xff

        Np34 = (Np3 & 0xff000000) >> 24
        Np33 = (Np3 & 0xff0000) >> 16
        Np32 = (Np3 & 0xff00) >> 8
        Np31 =  Np3 & 0xff

        Ms3H = (Ms3 & 0xff00) >> 8
        Ms3L =  Ms3 & 0xff

        CH3_context = [0xcd, 0x03, FS3H, FS3L, FO33, FO32, FO31, Np34, Np33, Np32, Np31, Ms3H, Ms3L]
        self.ser.write(CH3_context)
        self.showMessage.insert(0.0, '-CH3 通道已设置-')

        n3 = (FO3 - FS3) // Ms3  # 频率增加系数
        if n3 < 0:
            self.showerror.insert(0.0, '-CH3参数设置有误-')
        if Ms3 >65536:
            self.showerror.insert(0.0, '-CH3加速时间超过16bit-')

    def CH4_Serial(self):
        FS4 = int(self.FS4input.get())  # 16bit数据
        FO4 = int(self.FO4input.get())  # 24bit数据
        Np4 = int(self.Np4input.get())  # 32bit数据
        Ms4 = int(self.kx4input.get())  # 16bit数据

        FS4H = (FS4 & 0xff00) >> 8
        FS4L =  FS4 & 0xff

        FO43 = (FO4 & 0xff0000) >> 16
        FO42 = (FO4 & 0xff00) >> 8
        FO41 =  FO4 & 0xff

        Np44 = (Np4 & 0xff000000) >> 24
        Np43 = (Np4 & 0xff0000) >> 16
        Np42 = (Np4 & 0xff00) >> 8
        Np41 =  Np4 & 0xff

        Ms4H = (Ms4 & 0xff00) >> 8
        Ms4L =  Ms4 & 0xff

        CH4_context = [0xcd, 0x04, FS4H, FS4L, FO43, FO42, FO41, Np44, Np43, Np42, Np41, Ms4H, Ms4L]
        self.ser.write(CH4_context)
        self.showMessage.insert(0.0, '-CH4 通道已设置-')

        n4 = (FO4 - FS4) // Ms4  # 频率增加系数
        if n4 < 0:
            self.showerror.insert(0.0, '-CH4参数设置有误-')
        if Ms4 >65536:
            self.showerror.insert(0.0, '-CH4加速时间超过16bit-')

    def CH5_Serial(self):
        FS5 = int(self.FS5input.get())  # 16bit数据
        FO5 = int(self.FO5input.get())  # 24bit数据
        Np5 = int(self.Np5input.get())  # 32bit数据
        Ms5 = int(self.kx5input.get())  # 16bit数据

        FS5H = (FS5 & 0xff00) >> 8
        FS5L = FS5 & 0xff

        FO53 = (FO5 & 0xff0000) >> 16
        FO52 = (FO5 & 0xff00) >> 8
        FO51 =  FO5 & 0xff

        Np54 = (Np5 & 0xff000000) >> 24
        Np53 = (Np5 & 0xff0000) >> 16
        Np52 = (Np5 & 0xff00) >> 8
        Np51 =  Np5 & 0xff

        Ms5H = (Ms5  & 0xff00) >> 8
        Ms5L =  Ms5 & 0xff

        CH5_context = [0xcd, 0x05, FS5H, FS5L, FO53, FO52, FO51, Np54, Np53, Np52, Np51, Ms5H, Ms5L]
        print(CH5_context)
        self.ser.write(CH5_context)
        self.showMessage.insert(0.0, '-CH5 通道已设置-')

        n5 = (FO5 - FS5) // Ms5  # 频率增加系数
        if n5 < 0:
            self.showerror.insert(0.0, '-CH5参数设置有误-')
        if Ms5 >65536:
            self.showerror.insert(0.0, '-CH5加速时间超过16bit-')

    def CH6_Serial(self):
        FS6 = int(self.FS6input.get())  # 16bit数据
        FO6 = int(self.FO6input.get())  # 24bit数据
        Np6 = int(self.Np6input.get())  # 32bit数据
        Ms6 = int(self.kx6input.get())  # 16bit数据

        FS6H = (FS6 & 0xff00) >> 8
        FS6L = FS6 & 0xff

        FO63 = (FO6 & 0xff0000) >> 16
        FO62 = (FO6 & 0xff00) >> 8
        FO61 = FO6 & 0xff

        Np64 = (Np6 & 0xff000000) >> 24
        Np63 = (Np6 & 0xff0000) >> 16
        Np62 = (Np6 & 0xff00) >> 8
        Np61 = Np6 & 0xff

        Ms6H = (Ms6 & 0xff00) >> 8
        Ms6L = Ms6 & 0xff

        CH6_context = [0xcd, 0x06, FS6H, FS6L, FO63, FO62, FO61, Np64, Np63, Np62, Np61, Ms6H, Ms6L]
        print(CH6_context)
        self.ser.write(CH6_context)
        self.showMessage.insert(0.0, '-CH6 通道已设置-')

        n6 = (FO6 - FS6) // Ms6  # 频率增加系数
        if n6 < 0:
            self.showerror.insert(0.0, '-CH6参数设置有误-')
        if Ms6 >65536:
            self.showerror.insert(0.0, '-CH6加速时间超过16bit-')

    def CH7_Serial(self):
        FS7 = int(self.FS7input.get())  # 16bit数据
        FO7 = int(self.FO7input.get())  # 24bit数据
        Np7 = int(self.Np7input.get())  # 32bit数据
        Ms7 = int(self.kx7input.get())  # 16bit数据

        FS7H = (FS7 & 0xff00) >> 8
        FS7L =  FS7 & 0xff

        FO73 = (FO7 & 0xff0000) >> 16
        FO72 = (FO7 & 0xff00) >> 8
        FO71 =  FO7 & 0xff

        Np74 = (Np7 & 0xff000000) >> 24
        Np73 = (Np7 & 0xff0000) >> 16
        Np72 = (Np7 & 0xff00) >> 8
        Np71 =  Np7 & 0xff

        Ms7H = (Ms7  & 0xff00) >> 8
        Ms7L =  Ms7 & 0xff

        CH7_context = [0xcd, 0x07, FS7H, FS7L, FO73, FO72, FO71, Np74, Np73, Np72, Np71, Ms7H, Ms7L]
        print(CH7_context)
        self.ser.write(CH7_context)
        self.showMessage.insert(0.0, '-CH7 通道已设置-')

        n7 = (FO7 - FS7) // Ms7  # 频率增加系数
        if n7 < 0:
            self.showerror.insert(0.0, '-CH7参数设置有误-')
        if Ms7 >65536:
            self.showerror.insert(0.0, '-CH7加速时间超过16bit-')

    def CH8_Serial(self):
        FS8 = int(self.FS8input.get())  # 16bit数据
        FO8 = int(self.FO8input.get())  # 24bit数据
        Np8 = int(self.Np8input.get())  # 32bit数据
        Ms8 = int(self.kx8input.get())  # 16bit数据

        FS8H = (FS8 & 0xff00) >> 8
        FS8L =  FS8 & 0xff

        FO83 = (FO8 & 0xff0000) >> 16
        FO82 = (FO8 & 0xff00) >> 8
        FO81 =  FO8 & 0xff

        Np84 = (Np8 & 0xff000000) >> 24
        Np83 = (Np8 & 0xff0000) >> 16
        Np82 = (Np8 & 0xff00) >> 8
        Np81 =  Np8 & 0xff

        Ms8H = (Ms8 & 0xff00) >> 8
        Ms8L =  Ms8 & 0xff

        CH8_context = [0xcd, 0x08, FS8H, FS8L, FO83, FO82, FO81, Np84, Np83, Np82, Np81, Ms8H, Ms8L]
        print(CH8_context)
        self.ser.write(CH8_context)
        self.showMessage.insert(0.0, '-CH8 通道已设置-')

        n8 = (FO8 - FS8) // Ms8  # 频率增加系数
        if n8 < 0:
            self.showerror.insert(0.0, '-CH8参数设置有误-')
        if Ms8 >65536:
            self.showerror.insert(0.0, '-CH8加速时间超过16bit-')

    def CH9_Serial(self):
        FS9 = int(self.FS9input.get())  # 16bit数据
        FO9 = int(self.FO9input.get())  # 24bit数据
        Np9 = int(self.Np9input.get())  # 32bit数据
        Ms9 = int(self.kx9input.get())  # 16bit数据

        FS9H = (FS9 & 0xff00) >> 8
        FS9L =  FS9 & 0xff

        FO93 = (FO9 & 0xff0000) >> 16
        FO92 = (FO9 & 0xff00) >> 8
        FO91 =  FO9 & 0xff

        Np94 = (Np9 & 0xff000000) >> 24
        Np93 = (Np9 & 0xff0000) >> 16
        Np92 = (Np9 & 0xff00) >> 8
        Np91 =  Np9 & 0xff

        Ms9H = (Ms9 & 0xff00) >> 8
        Ms9L =  Ms9 & 0xff

        CH9_context = [0xcd, 0x09, FS9H, FS9L, FO93, FO92, FO91, Np94, Np93, Np92, Np91, Ms9H, Ms9L]
        print(CH9_context)
        self.ser.write(CH9_context)
        self.showMessage.insert(0.0, '-CH9 通道已设置-')

        n9 = (FO9 - FS9) // Ms9  # 频率增加系数
        if n9 < 0:
            self.showerror.insert(0.0, '-CH9参数设置有误-')
        if Ms9 >65536:
            self.showerror.insert(0.0, '-CH9加速时间超过16bit-')

    def Trun_On(self):
        N0 = self.status0.get()
        N1 = self.status1.get()
        N2 = self.status2.get()
        N3 = self.status3.get()
        N4 = self.status4.get()
        N5 = self.status5.get()
        N6 = self.status6.get()
        N7 = self.status7.get()
        N8 = self.status8.get()
        N9 = self.status9.get()

        N = (N9<<9) + (N8<<8) + (N7<<7) + (N6<<6) + (N5<<5) + (N4<<4) + (N3<<3) + (N2<<2) + (N1<<1) + N0
        NH = (N & 0xff00) >> 8
        NL =  N & 0xff

        Opear_context = [0xeb, NH, NL, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        print(Opear_context)
        self.ser.write(Opear_context)
        print('trun on')

    def open(self):
        self.ser.open()
        if self.ser.isOpen() == True:
            self.showSerial.delete(0.0, END)
            self.showSerial.insert(0.0, "Serial has been opend!")
            print("open success")
        else:
            print("open failed")
        t = threading.Thread(target=self.Receive)
        t.setDaemon(True)
        t.start()

    def close(self):
        self.ser.close()
        if self.ser.isOpen() == False:
            self.showSerial.delete(0.0, END)
            self.showSerial.insert(0.0, "Serial has been closed!")
        else:
            print("close failed")


    def Receive(self):
        data = ''
        frame_state = 0
        while True:
            while self.ser.inWaiting() > 0:
                data = self.ser.read(1)
                if (data[0] == 205):
                    frame_state = 1
                    data = self.ser.read(7)
                    print(data)
                else:
                    frame_state = 0
                    del data


            if(frame_state == 1 ):
                # ----------------------------------------------------------#
                if (data[2] & 0x01) == 1:
                    self.CH0show.insert(0.0, '√')
                else:
                    self.CH0show.insert(0.0, ' ')
                if (data[2] & 0x02) == 2:
                    self.CH1show.insert(0.0, '√')
                else:
                    self.CH1show.insert(0.0, ' ')
                if (data[2] & 0x04) == 4:
                    self.CH2show.insert(0.0, '√')
                else:
                    self.CH2show.insert(0.0, ' ')
                if (data[2] & 0x08) == 8:
                    self.CH3show.insert(0.0, '√')
                else:
                    self.CH3show.insert(0.0, ' ')
                if (data[2] & 0x10) == 0x10:
                    self.CH4show.insert(0.0, '√')
                else:
                    self.CH4show.insert(0.0, ' ')
                if (data[2] & 0x20) == 0x20:
                    self.CH5show.insert(0.0, '√')
                else:
                    self.CH5show.insert(0.0, ' ')
                if (data[2] & 0x40) == 0x40:
                    self.CH6show.insert(0.0, '√')
                else:
                    self.CH6show.insert(0.0, ' ')
                if (data[2] & 0x80) == 0x80:
                    self.CH7show.insert(0.0, '√')
                else:
                    self.CH7show.insert(0.0, ' ')

                if (data[1] & 0x01) == 1:
                    self.CH8show.insert(0.0, '√')
                else:
                    self.CH8show.insert(0.0, ' ')
                if (data[1] & 0x02) == 2:
                    self.CH9show.insert(0.0, '√')
                else:
                    self.CH9show.insert(0.0, ' ')
                # ----------------------------------------------------------#
                if (data[6] & 0x01) == 1:
                    self.CH0rNp.insert(0.0, ' ')
                else:
                    self.CH0rNp.insert(0.0, '■')
                if (data[6] & 0x02) == 2:
                    self.CH1rNp.insert(0.0, ' ')
                else:
                    self.CH1rNp.insert(0.0, '■')
                if (data[6] & 0x04) == 4:
                    self.CH2rNp.insert(0.0, ' ')
                else:
                    self.CH2rNp.insert(0.0, '■')
                if (data[6] & 0x08) == 8:
                    self.CH3rNp.insert(0.0, ' ')
                else:
                    self.CH3rNp.insert(0.0, '■')
                if (data[6] & 0x10) == 0x10:
                    self.CH4rNp.insert(0.0, ' ')
                else:
                    self.CH4rNp.insert(0.0, '■')

                if (data[6] & 0x20) == 0x20:
                    self.CH5rNp.insert(0.0, ' ')
                else:
                    self.CH5rNp.insert(0.0, '■')
                if (data[6] & 0x40) == 0x40:
                    self.CH6rNp.insert(0.0, ' ')
                else:
                    self.CH6rNp.insert(0.0, '■')
                if (data[6] & 0x80) == 0x80:
                    self.CH7rNp.insert(0.0, ' ')
                else:
                    self.CH7rNp.insert(0.0, '■')

                if (data[5] & 0x01) == 1:
                    self.CH8rNp.insert(0.0, ' ')
                else:
                    self.CH8rNp.insert(0.0, '■')
                if (data[5] & 0x02) == 2:
                    self.CH9rNp.insert(0.0, ' ')
                else:
                    self.CH9rNp.insert(0.0, '■')
                # ----------------------------------------------------------#
                if (data[4] & 0x01) == 1:
                    self.CH0lNp.insert(0.0, ' ')
                else:
                    self.CH0lNp.insert(0.0, '■')
                if (data[4] & 0x02) == 2:
                    self.CH1lNp.insert(0.0, ' ')
                else:
                    self.CH1lNp.insert(0.0, '■')
                if (data[4] & 0x04) == 4:
                    self.CH2lNp.insert(0.0, ' ')
                else:
                    self.CH2lNp.insert(0.0, '■')
                if (data[4] & 0x08) == 8:
                    self.CH3lNp.insert(0.0, ' ')
                else:
                    self.CH3lNp.insert(0.0, '■')
                if (data[4] & 0x10) == 0x10:
                    self.CH4lNp.insert(0.0, ' ')
                else:
                    self.CH4lNp.insert(0.0, '■')

                if (data[4] & 0x20) == 0x20:
                    self.CH5lNp.insert(0.0, ' ')
                else:
                    self.CH5lNp.insert(0.0, '■')
                if (data[4] & 0x40) == 0x40:
                    self.CH6lNp.insert(0.0, ' ')
                else:
                    self.CH6lNp.insert(0.0, '■')
                if (data[4] & 0x80) == 0x80:
                    self.CH7lNp.insert(0.0, ' ')
                else:
                    self.CH7lNp.insert(0.0, '■')

                if (data[3] & 0x01) == 1:
                    self.CH8lNp.insert(0.0, ' ')
                else:
                    self.CH8lNp.insert(0.0, '■')
                if (data[3] & 0x02) == 2:
                    self.CH9lNp.insert(0.0, ' ')
                else:
                    self.CH9lNp.insert(0.0, '■')

            sleep(1)  # 0.1秒接收一次
        return self.data


root = Tk() #创建父容器GUI
x = root.winfo_screenwidth()
y = root.winfo_screenheight()
print(x,y)
root.title("多轴运算控制器---深圳星火自动化科技有限公司")#父容器标题
root.geometry("1405x690")#设置父容器窗口初始大小，若没有此设置，窗口会随着组件大小的变化而变化  1000x769
app = GUI(root)
root.mainloop()




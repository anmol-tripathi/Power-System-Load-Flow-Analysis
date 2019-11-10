#Tkinter start basics
from tkinter import *
import tkinter.messagebox
def main():
    global entry1
    root = Tk()
    label1 = Label(text="Computer Techniques in Power System")
    label1.pack()

    entry1= Entry(bd=2)
    entry1.pack()

    button1 = Button(text="Welcome",command=hello)
    button1.pack()
    root.mainloop()

def hello():
    tkinter.messagebox.showinfo("GUI Program","Hello "+entry1.get())
    
if __name__=='__main__':
    main()
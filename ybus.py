import numpy as np
import os
import cmath
import csv
import pandas as pd

def display(self, data):
		data.head()

class ybus:
	def make_y_bus:




class line_data:


	def enter_data(self):
		nb = int(input("Enter the number of Buses: ")) 
		nl = int(input("Enter the number of Lines: "))
		from_bus = []
		to_bus = []
		R = []
		X = []
		Z = []
		G = []
		B = []
		Y = []
		turns_ratio = []
		for i in range(0,nl):
			print("\n\n Entry Number: ", i+1)
			x = input("\n Enter the from bus: ")
			if(x<=nb):
				from_bus.append(x)
			x = input("\n Enter the to bus: ")
			if(x<=nb):
				to_bus.append(x)
			x = input("\n Enter the Line Resistance: ")
			R.append(x)
			Z.append(complex(R[i],X[i]))
			print("\n Line Impedence = ", Z[i])

			Y.append(1/Z[i])
			G.append(Y[i].real)
			B.append(Y.[i].imag)
			print("\n Line Admittance = ", Y[i])
			x = input("\n Enter the turns ratio: ")
			turns_ratio.append(x)

		data_matrix = [(from_bus[i], to_bus[i], R[i], X[i], G[i], B[i], turns_ratio[i]) for i in range(0, nl)] 

			



	def read_from_csv(self):
		print("\n\n Please make sure that the CSV has data in following format: \n\n \n\n Note: The csv file should be in the same directory")
		filename = input("\n Enter the CSV Filename:  ")
		dir_path = os.getcwd()
		csv_path = os.path.join(dir_path, filename)
		data = pd.read_csv(csv_path)
		line_data.display(data)
		return(data)



#!/bin/bash
#Purpose:Create a directory such that anyone in the group can create a file and access any person’s file in it but none should be able to delete a file other than the one created by himself.
#Created Date: 24 March, 2023
#Author: Selorm Butsor Gamenyah
# START #

mkdir direc_1

chmod g+wx direc_1

chmod +t direc_1


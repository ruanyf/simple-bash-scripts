#!/bin/bash

# This script calculates the area of various shapes.

echo "What shape do you want to calculate the area of? Choose from the following:"
echo "1. Square"
echo "2. Rectangle"
echo "3. Circle"
echo "4. Rhombus"
echo "5. Triangle"

read choice

case $choice in
    1)
        echo "Enter the length of one side of the square:"
        read length
        area=$(echo "$length * $length" | bc)
        echo "The area of the square is $area"
        ;;
    2)
        echo "Enter the length of the rectangle:"
        read length
        echo "Enter the width of the rectangle:"
        read width
        area=$(echo "$length * $width" | bc)
        echo "The area of the rectangle is $area"
        ;;
    3)
        echo "Enter the radius of the circle:"
        read radius
        pi=$(echo "scale=10; 4*a(1)" | bc -l)
        area=$(echo "$pi * $radius * $radius" | bc)
        echo "The area of the circle is $area"
        ;;
    4)
        echo "Enter the length of one diagonal of the rhombus:"
        read diagonal1
        echo "Enter the length of the other diagonal of the rhombus:"
        read diagonal2
        area=$(echo "scale=2; ($diagonal1 * $diagonal2) / 2" | bc)
        echo "The area of the rhombus is $area"
        ;;
    5)
        echo "Enter the base of the triangle:"
        read base
        echo "Enter the height of the triangle:"
        read height
        area=$(echo "scale=2; ($base * $height) / 2" | bc)
        echo "The area of the triangle is $area"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

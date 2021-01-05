using System;

namespace FavoriteNumber
{
  class Program
  {
    static void Main(string[] args)
    {
      // Ask user for fave number
      Console.Write("Enter your favorite number: ");
      // Turn that string into an int
      int faveNumber = Convert.ToInt32(Console.ReadLine());

      // Number of pizza shops
      int pizzaShops = 4332;

      // Number of employees
      int totalEmployees = 86928;

      // Revenue 
      double revenue = 390819.28;

      // Log the values to the console:
      Console.WriteLine(pizzaShops);
      Console.WriteLine(totalEmployees);
      Console.WriteLine(revenue);

      // Number of students
      int students = 18;

      // Number of students in a group
      int groupSize = 4;

      // Does groupSize go evenly into students?
      Console.WriteLine(students % groupSize);
    }
  }
}

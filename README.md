# AuthenticationTemplate
Template using the old microsoft Simple Membership 
======================================================
There are back end admin pages for managing the users and their access that the new Microsoft Identity does not have.
Here is a Webform template using the old tool with some new webform items and bootstrap.

Before you compile:

(Step 6 can be done first)

1. Set up a database with a sysAdmin rights in SQL management studio.
2. Create a new database and assign the role to it.
3. Point the connection string in the webconfig to this database.
4. Start the application and register as a new user.  This will create the tables within the database.
5. Once you have given your user some sort of 'Administrator' rights, fix the webconfig in the Admin=>Access folder to limit users.
6. Rename the solution by following the below steps.








Here are steps you need to follow to rename a solution:

In Solution Explorer, right-click the project, select Rename, and enter a new name.
In Solution Explorer, right-click the project and select Properties. On the Application tab, change the "Assembly name" and "Default namespace".
In the main cs file (or any other code files), rename the namespace declaration to use the new name. For this right-click the namespace and select Refactor > Rename enter a new name. For example:  namespace WindowsFormsApplication1
Change the AssemblyTitle and AssemblyProduct in Properties/AssemblyInfo.cs.
[assembly: AssemblyTitle("New Name Here")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("New Name Here")]
[assembly: AssemblyCopyright("Copyright ©  2013")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
Delete bin and obj directories physically.
Rename the project physical folder directory.
Open the SLN file (within notepad or any editor) and change the path to the project.
Clean and Rebuild the project.
# SyncroTicketApp
This is a small powershell Gui app for Syncro to create a simple ticket

To use, you will need to edit the $subdomain variable in the script

You can test this by just running the script, but to deploy to clients, you will need
to .exe using a utility here: https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5

Once you have the .exe created (I called mine ticket.exe), you need to upload it to a server
so that you can pull it using https://websiteyouhavethefileat.com/files/ticket.exe 

Once you have the exe file uploaded and you know the url location, you then need to create a new taskbar menu
item as follows:

Menu Type:  File

Menu Title:  Open A Ticket (you can name this whatever you'd like)

URL:  The url from above

** This is a work in progress 

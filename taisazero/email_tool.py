import yagmail

class EmailTool:

    def __init__(self,to,message,subject,file=None):
        self.message=message
        self.subject=subject
        self.file=file
        self.to=to


    def send(self):
        sender= yagmail.SMTP('rumibot02@gmail.com','cheezekun')
        if self.file!=None:
            contents= [self.message,self.file]

        else:
            contents=[self.message]

        sender.send(self.to,self.subject,contents)











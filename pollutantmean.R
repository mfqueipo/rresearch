pollutantmean <- function(directory,sulfate,id)
  { 
   filenames<-list.files(path = "C:/Users/Hp/Desktop/specdata")
   mydata<-NULL
  
  for(i in filenames)
  {  
    filepath <- file.path("C:/Users/Hp/Desktop/specdata", paste(i, sep=","))
    mydata<-rbind(mydata,read.csv(filepath, header = TRUE, sep = ","))
  }

  mydata2<-mydata[complete.cases(mydata$sulfate),]
  
  mydata3<-NULL
  
  for (j in id)
  {
  mydata3<-rbind(mydata3,subset(mydata2,ID == j))
  }
  
  return(mean(mydata3$sulfate,na.rm=TRUE))
  
}

pollutantmean("C:/Users/Hp/Desktop/specdata",sulfate,1:5)

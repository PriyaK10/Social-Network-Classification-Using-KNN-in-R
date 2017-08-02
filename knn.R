# knn

d1=read.csv("C:/Users/1542283/Desktop/Social_Network_Ads.csv", stringsAsFactors = F, header=T)
d1=d1[-1]
str(d1)
d1$Gender=factor(d1$Gender, levels = c("Male","Female"),labels = c(0,1))
d1$Purchased=factor(d1$Purchased)
d1[2:3]=scale(d1[2:3])
intrain1=createDataPartition(d1$Purchased,p=0.8, list=F)
trset=d1[intrain1,]
tset=d1[-intrain1,]
library(class)
y_pred=knn(train=trset[,-4],
           test=tset[,-4],
           cl=trset[,4],
           k=5)
confusionMatrix(y_pred,tset[,4])

# using caret

model=train(trset[,1:3], trset[,4], method='knn')
y_pred1=predict(model, newdata=tset)
confusionMatrix(y_pred1,tset[,4])



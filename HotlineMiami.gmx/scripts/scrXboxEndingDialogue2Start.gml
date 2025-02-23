if reload>0 exit
reload=2
if current<messages {if face[current]>face[current+1] change=1 if face[current]<face[current+1] change=1 current+=1} else {
stop=1
}

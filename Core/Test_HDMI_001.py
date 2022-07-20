import sys
from python_imagesearch.imagesearch import imagesearch_numLoop, imagesearch_count

MasterImageName = "./Core_Test_HDMI_Berry.png"
LoopsInSeconds = 5 #Wait for 5 seconds

pos = imagesearch_numLoop(MasterImageName, 1, LoopsInSeconds)
if pos[0] != -1:
    print("position : ", pos[0], pos[1])
    print("Master image found!")
    sys.exit(0)
else:
    print("Image not found")
    sys.exit(1)

#TODO Counter?
#imagecounter = imagesearch_count("./Core_Test_HDMI_Berry.png")
#print(imagecounter)
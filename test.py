import pygame
import button
from PIL import Image

SCREEN_HEIGHT = 320
SCREEN_WIDTH= 480

screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption('Studdy Buddy Inc.')

menu=Image.open('images/Menu_tittle.png')
timer=Image.open('images/button_timer.png')
pomodoro=Image.open('images/button_pomodoro.png')
teachme=Image.open('images/button_teachme.png')
meditation=Image.open('images/button_meditation.png')

options_x = SCREEN_WIDTH/2-(timer.width/3)
options_y = SCREEN_HEIGHT/4 + (SCREEN_HEIGHT*0.75)
options_height = (SCREEN_HEIGHT*0.15)
options_width = (SCREEN_WIDTH/3)

#timer.show()
print(timer.height, timer.width)
timer_img=pygame.image.load('images/button_timer.png').convert_alpha()
timer_img_scale=pygame.transform.scale(timer_img, (options_width, options_height))
print(timer_img)


print(options_x)
print(options_y)
print(options_height)
print(options_width)
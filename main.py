import pygame
import button
from PIL import Image


SCREEN_HEIGHT = 320
SCREEN_WIDTH= 480

screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption('Studdy Buddy Inc.')

menu_img=pygame.image.load('images/Menu_tittle.png').convert_alpha()
timer_img=pygame.image.load('images/button_timer.png').convert_alpha()
pomodoro_img=pygame.image.load('images/button_pomodoro.png').convert_alpha()
teachme_img=pygame.image.load('images/button_teachme.png').convert_alpha()
meditation_img=pygame.image.load('images/button_meditation.png').convert_alpha()


menu=Image.open('images/Menu_tittle.png')
timer=Image.open('images/button_timer.png')
pomodoro=Image.open('images/button_pomodoro.png')
teachme=Image.open('images/button_teachme.png')
meditation=Image.open('images/button_meditation.png')



class Button():
    def __init__(self, x, y, image):
        self.image=image
        self.rect = self.image.get_rect()
        self.rect.topleft = (x,y)

    def draw(self):

        #get mouse pos
        pos = pygame.mouse.get_pos()
        

        #check mouse over anc click condition
        if self.rect.collidepoint(pos):
            if pygame.mouse.get_pressed()[0] ==1:
                print("click")


        #draw button on screen
        screen.blit(self.image, (self.rect.x, self.rect.y))


vertical_space=SCREEN_HEIGHT*0.05

#getting responsive coordinates for menu

tittle_height= (SCREEN_HEIGHT/20)*3
tittle_width = (SCREEN_WIDTH/5)*2

menu_img_scale=pygame.transform.scale(menu_img, (tittle_width, tittle_height))

tittle_x=SCREEN_WIDTH/2 -(tittle_width/2)
tittle_y=SCREEN_HEIGHT/4 - (tittle_height)+vertical_space*0.5


#Getting responsive coordinates for options

##TIMER###
options_height = (SCREEN_HEIGHT*0.15)
options_width = (SCREEN_WIDTH/3)

timer_img_scale=pygame.transform.scale(timer_img, (options_width, options_height)) 

options_x_timer = SCREEN_WIDTH/2-(options_width/2)
options_y_timer = SCREEN_HEIGHT/4 + vertical_space

##POMODORO##

pomodoro_img_scale=pygame.transform.scale(pomodoro_img, (options_width, options_height)) 

options_x_pomodoro = SCREEN_WIDTH/2-(options_width/2)
options_y_pomodoro = SCREEN_HEIGHT/4 + vertical_space + options_height

##TEACH ME##

teachme_img_scale=pygame.transform.scale(teachme_img, (options_width, options_height)) 

options_x_teachme = SCREEN_WIDTH/2-(options_width/2)
options_y_teachme = SCREEN_HEIGHT/4 + vertical_space + options_height*2

## MEDITATION ##
meditation_img_scale=pygame.transform.scale(meditation_img, (options_width, options_height)) 

options_x_meditation = SCREEN_WIDTH/2-(options_width/2)
options_y_meditation = SCREEN_HEIGHT/4 + vertical_space + options_height*3


##Button Initialization 
Menu_button = Button(tittle_x, tittle_y, menu_img_scale)
timer_button = Button(options_x_timer, options_y_timer, timer_img_scale)
pomodoro_button = Button(options_x_pomodoro, options_y_pomodoro, pomodoro_img_scale)
techme_button = Button(options_x_teachme, options_y_teachme, teachme_img_scale)
meditation_button = Button(options_x_meditation, options_y_meditation, meditation_img_scale)



run= True

while run: 

    screen.fill((214, 145, 160))

    Menu_button.draw()
    timer_button.draw()

    pomodoro_button.draw()
    techme_button.draw()
    meditation_button.draw()

    #event handler
    for event in pygame.event.get():
        #quit game
        if event.type == pygame.QUIT:
            run=False
    
    pygame.display.update()

pygame.quit()
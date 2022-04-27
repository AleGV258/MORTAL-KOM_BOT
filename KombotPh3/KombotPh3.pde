/**
Integrantes:
  - García Vargas Michell Alejandro - 259663
  - Daniel León Paulin - 260541
Semestre: 6to. Semestre
Grupo: 30
Materia: Desarrollo de Aplicaciones Móviles
MORTAL KOM_BOT: PHASE II
*/

//Variables
PImage dron1, dron2, dron3, dron4, dron5, dron6, androide1, androide2, androide3, androide4, androide5, androide6, androide7, androide8, androide9, explosion1, explosion2, explosion3, explosion4, bola1, bola2, bola3, bola4, misil, corazon, procesador, fondo, reset; //Variables de Imágenes
PFont fuente1, fuente2; //Variables de las fuentes

//Configuración Fondo
int xFondo1 = 0; //Fondo NO. 1 para formar el efecto Parallax
int xFondo2 = -1280; //Fondo NO. 2 para formar el efecto Parallax

//Configuración Androide
String vida1; //Variable de la vida del Androide
boolean direccionAndroide = true; //Saber hacía que dirección se mueve el Androide, true = derecha, false = izquierda
float xAndroide; //Posición x del Androide
float velocidadAndroide = 5; //Velocidad del Androide
int vidaAndroide = 3; //Vidas del Androide
int contadorAndroide = 0; //Contador para renderizar frames del Androide

//configuración Dron
String vida2; //Variable de la vida del Dron
float yDron = -50; //Posición y del Dron
float xDron = 1080; //Posición x del Dron
float velocidadDron = 7; ////Velocidad del Dron
int vidaDron = 3; //Vidas del Dron
int contadorDron = 0; //Contador para renderizar frames del Dron

//Configuración Proyectil de Dron
boolean disparandoDron = false; //Variable para saber si el Dron ha disparado
boolean llegoFinalProyectilDron = false; //Variable para saber si el Proyectil llego al final
boolean explotandoAndroide = false; //Variable para conocer si el Androide sigue explotando
float proyectilDronY; //Posición y del Proyectil
float proyectilDronX; //Posición x del Proyectil
float velocidad = 0; //Velocidad del Proyectil
int clicDron = 0; //Variable para saber si el Proyectil sigue cayendo
int contadorExplosionDron = 0; //Contador para renderizar frames de la Explosión
int entroDron = 0; //Variable para dejar un rato los mensajes

//Configuración Proyectil de Androide
boolean disparandoAndroide = false; //Variable para saber si el Androide ha disparado
boolean llegoFinalProyectilAndroide = false; //Variable para saber si el Proyectil llego al final
boolean explotandoDron = false; //Variable para conocer si el Dron sigue explotando
boolean direccionDisparoAndroide = true; //Variable para saber la dirección del disparo del Androide
float proyectilAndroideY; //Posición y del Proyectil
float proyectilAndroideX; //Posición x del Proyectil
float velocidadProyectilAndroideX; //Velocidad en x del Proyectil
float velocidadProyectilAndroideY; //Velocidad en y del Proyectil
int clicAndroide = 0; //Variable para saber si el Proyectil sigue lanzandose
int contadorExplosionAndroide = 0; //Contador para renderizar frames de la Explosión
int contadorBola = 0; //Contador para renderizar frames del Dron
int entroAndroide = 0; //Variable para dejar un rato los mensajes

//Configuración General
final float gravedad = 0.98; //Gravedad para los Proyectiles

//Configuración del programa
void settings() {
  //fullScreen(); //Pantalla completa
  size(1280, 800); //Tamaño de la ventana, lienzo
}

//Iniciar el programa
void setup(){
  orientation(LANDSCAPE);
  corazon = loadImage("Corazon.png"); //Cargar la imagen del Corazón
  procesador = loadImage("Procesador.png"); //Cargar la imagen del Procesador
  misil = loadImage("Misil.png"); //Cargar la imagen del Misil
  explosion1 = loadImage("Explosion1.png"); //Cargar un frame de la Explosión
  explosion2 = loadImage("Explosion2.png"); //Cargar un frame de la Explosión
  explosion3 = loadImage("Explosion3.png"); //Cargar un frame de la Explosión
  explosion4 = loadImage("Explosion4.png"); //Cargar un frame de la Explosión
  bola1 = loadImage("Bola1.png"); //Cargar un frame de la Bola de Energía
  bola2 = loadImage("Bola2.png"); //Cargar un frame de la Bola de Energía
  bola3 = loadImage("Bola3.png"); //Cargar un frame de la Bola de Energía
  bola4 = loadImage("Bola4.png"); //Cargar un frame de la Bola de Energía
  dron1 = loadImage("Dron_Movimiento1.png"); //Cargar un frame del Dron
  dron2 = loadImage("Dron_Movimiento2.png"); //Cargar un frame del Dron
  dron3 = loadImage("Dron_Movimiento3.png"); //Cargar un frame del Dron
  dron4 = loadImage("Dron_Ataca.png"); //Cargar un frame del Dron cuando va a atacar
  dron5 = loadImage("Dron_Disparo.png"); //Cargar un frame del Dron cuando dispara
  dron6 = loadImage("Dron_Muerte.png"); //Cargar un frame del Dron cuando muere
  androide1 = loadImage("Androide_Movimiento1.png"); //Cargar la imagen del Androide
  androide2 = loadImage("Androide_Movimiento2.png"); //Cargar la imagen del Androide
  androide3 = loadImage("Androide_Movimiento3.png"); //Cargar la imagen del Androide
  androide4 = loadImage("Androide_Movimiento4.png"); //Cargar la imagen del Androide
  androide5 = loadImage("Androide_Movimiento5.png"); //Cargar la imagen del Androide
  androide6 = loadImage("Androide_Movimiento6.png"); //Cargar la imagen del Androide
  androide7 = loadImage("Androide_Muerte.png"); //Cargar la imagen del Androide cuando muere
  androide8 = loadImage("Androide_Disparo1.png"); //Cargar la imagen del Androide cuando dispara
  androide9 = loadImage("Androide_Disparo2.png"); //Cargar la imagen del Androide cuando dispara
  fondo = loadImage("Background1.jpg"); //Cargar la imagen del Fondo
  fondo.resize(1280, 800); //Redimensionar cualquier fondo a la escala del lienzo
  fuente1 = createFont("Avalors.otf", 40); //Cargar la fuente de los misilazos
  fuente2 = createFont("Dead.otf", 20); //Cargar la fuente de las vidas
  reset = loadImage("reset.png"); //Cargar imagen reset
}

void draw(){
  image(fondo, xFondo1, 0); //Primer imagen del efecto Parallax
  image(fondo, xFondo2, 0); //Segunda imagen del efecto Parallax
  xFondo1 = xFondo1 + 1; //Velocidad con la que se mueve la primera imagen del efecto Parallax del fondo
  if(xFondo1 == 1280){ //Cuando llega al borde de la pantalla se restablece la posición
    xFondo1 = -1280;
  }
  xFondo2 = xFondo2 + 1; //Velocidad con la que se mueve la segunda imagen del efecto Parallax del fondo
  if(xFondo2 == 1280){ //Cuando llega al borde de la pantalla se restablece la posición
    xFondo2 = -1280;
  }
  
  //Movimiento del Dron
  xDron = xDron - velocidadDron;
  if(xDron <= (0 - 200)){ //Cuando llega al borde, se mueve al otro lado
    xDron = displayWidth - 200;
  }

  //Renderizar por frames al Dron
  if(contadorDron == 41){ image(dron6, xDron, yDron, 400, 400); velocidadDron = 0; }
  if(contadorDron == 40){ contadorDron = 0; }
  if(contadorDron >= 25 && contadorDron < 35){ image(dron5, xDron, -100, 400, 400); }
  if((contadorDron >= 21 && contadorDron < 25) || (contadorDron >= 35 && contadorDron < 40)){ image(dron4, xDron, -100, 400, 400); }
  if(contadorDron == 20){ contadorDron = 0; }
  if(contadorDron >= 10 && contadorDron < 15){ image(dron3, xDron, -96, 400, 400); }
  if((contadorDron >= 5 && contadorDron < 10) || (contadorDron >= 15 && contadorDron < 20)){ image(dron2, xDron, -100, 400, 400); }
  if(contadorDron >= 0 && contadorDron < 5){ image(dron1, xDron, -100, 400, 400); }
  contadorDron = contadorDron + 1;
  
  //Movimiento de la dirección del Androide
  if(direccionAndroide == true){ //Hacia la derecha
    xAndroide = xAndroide + velocidadAndroide;
  }else{ //Hacia la izquierda
    xAndroide = xAndroide - velocidadAndroide;
  }
  if(xAndroide == 1150){ //Cambio de dirección
    direccionAndroide = false;
  }
  if(xAndroide == -130){ //Cambio de dirección
    direccionAndroide = true;
  }
  
  //Renderizar por frames al Androide
  if(contadorAndroide == 26){ image(androide7, xAndroide, 480, 260, 260); velocidadAndroide = 0; }
  if(contadorAndroide == 25){ contadorAndroide = 5; }
  if((contadorAndroide >= 21 && contadorAndroide < 25) && direccionAndroide == true){ image(androide8, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 21 && contadorAndroide < 25) && direccionAndroide == false){ image(androide9, xAndroide, 480, 260, 260); }
  if(contadorAndroide == 20){ contadorAndroide = 0; }
  if((contadorAndroide >= 10 && contadorAndroide < 15) && direccionAndroide == true){ image(androide3, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 10 && contadorAndroide < 15) && direccionAndroide == false){ image(androide6, xAndroide, 480, 260, 260); }
  if(((contadorAndroide >= 5 && contadorAndroide < 10) || (contadorAndroide >= 15 && contadorAndroide < 20)) && direccionAndroide == true){ image(androide2, xAndroide, 480, 260, 260); }
  if(((contadorAndroide >= 5 && contadorAndroide < 10) || (contadorAndroide >= 15 && contadorAndroide < 20)) && direccionAndroide == false){ image(androide5, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 0 && contadorAndroide < 5) && direccionAndroide == true){ image(androide1, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 0 && contadorAndroide < 5) && direccionAndroide == false){ image(androide4, xAndroide, 480, 260, 260); }
  contadorAndroide = contadorAndroide + 1;
  
  //HitBox del Androide
  //square(xAndroide+90,540,2);square(xAndroide+90,690,2);square(xAndroide+170,540,2);square(xAndroide+170,690,2);
  //square(proyectilDronX-50,proyectilDronY-30,2);square(proyectilDronX-50+70,proyectilDronY-30,2);square(proyectilDronX-50,proyectilDronY-30+70,2);square(proyectilDronX-50+70,proyectilDronY-30+70,2);
  //Proyectil Dron  
  if(disparandoDron){
    //Verificar si el Proyectil aún se encuentra cayendo
    if(llegoFinalProyectilDron == false){
      velocidad = velocidad + gravedad;
      proyectilDronY = proyectilDronY + velocidad; 
      image(misil, proyectilDronX - 50, proyectilDronY - 30, 70, 70); //Imagen del Proyectil
    }
    //Verificar si el Proyectil llego al final del lienzo
    if(proyectilDronY > height){ //El disparo sobrepasa el borde de ventana     
      llegoFinalProyectilDron = true;    
      clicDron = 0;
    }
    //Verificación de que el Proyectil sí interceptó a Androide
    if((proyectilDronX < xAndroide + 170 && proyectilDronX > xAndroide + 90) && (proyectilDronY > 540 && proyectilDronY < 690)){
      disparandoDron = false;
      llegoFinalProyectilDron = true;
      explotandoAndroide = true;
      vidaAndroide = vidaAndroide -1;
      clicDron = 0;
      entroAndroide = 0;
    }
  }
  
  //HitBox del Dron
  //square(xDron+290,30,2);square(xDron+290,130,2);square(xDron+110,30,2);square(xDron+110,130,2);
  //square(proyectilAndroideX,proyectilAndroideY,2);square(proyectilAndroideX+50,proyectilAndroideY,2);square(proyectilAndroideX,proyectilAndroideY+50,2);square(proyectilAndroideX+50,proyectilAndroideY+50,2);
  //Proyectil Androide  
  if(disparandoAndroide){
    //Verificar si el Proyectil aún se encuentra lanzandose
    if(llegoFinalProyectilAndroide == false){
      velocidadProyectilAndroideY = velocidadProyectilAndroideY - gravedad;   
      proyectilAndroideY = proyectilAndroideY - velocidadProyectilAndroideY ;
      if(velocidadProyectilAndroideX > 0){
        velocidadProyectilAndroideX = velocidadProyectilAndroideX - 0.1;
      }
      if (direccionDisparoAndroide == true){ //Se tira a la derecha
        proyectilAndroideX = proyectilAndroideX + velocidadProyectilAndroideX; 
      }else{ //Se tira a la izquierda   
        proyectilAndroideX = proyectilAndroideX - velocidadProyectilAndroideX; 
      }
      if(contadorBola == 12){ contadorBola = 0; }
      if(contadorBola >= 9 && contadorBola < 12){ image(bola4, proyectilAndroideX, proyectilAndroideY, 50, 50); }
      if(contadorBola >= 6 && contadorBola < 9){ image(bola2, proyectilAndroideX, proyectilAndroideY, 50, 50); }
      if(contadorBola >= 3 && contadorBola < 6){ image(bola3, proyectilAndroideX, proyectilAndroideY, 50, 50); }
      if(contadorBola >= 0 && contadorBola < 3){ image(bola1, proyectilAndroideX, proyectilAndroideY, 50, 50); }
      contadorBola = contadorBola + 1;
    }    
    //Verificar si el Proyectil llego al final del lienzo
    if(proyectilAndroideY > height){ //El disparo sobrepasa el borde de ventana         
      llegoFinalProyectilAndroide = true;
      clicAndroide = 0;
    }
    //Verificación de que el Proyectil sí interceptó al Dron
    if((proyectilAndroideX < xDron + 290 && proyectilAndroideX > xDron + 110) && (proyectilAndroideY > 30 && proyectilAndroideY < 130)){
      disparandoAndroide = false;
      llegoFinalProyectilAndroide = true;
      explotandoDron = true;
      vidaDron = vidaDron - 1;
      clicAndroide = 0;
      entroDron = 0;
    }
  }
  
  //Renderizar frames de la Explosión
  //En el Androide
  if(contadorExplosionDron <= 20 && explotandoAndroide == true){
    if(contadorExplosionDron >= 15 && contadorExplosionDron < 20){ image(explosion4, xAndroide + 80, 570, 100, 100); }
    if(contadorExplosionDron >= 10 && contadorExplosionDron < 15){ image(explosion3, xAndroide + 80, 570, 100, 100); }
    if(contadorExplosionDron >= 5 && contadorExplosionDron < 10){ image(explosion2, xAndroide + 80, 570, 100, 100); }
    if(contadorExplosionDron >= 0 && contadorExplosionDron < 5){ image(explosion1, xAndroide + 80, 570, 100, 100); }
    contadorExplosionDron = contadorExplosionDron + 1;
  }else{
    explotandoAndroide = false;
    contadorExplosionDron = 0;
  }
  //En el Dron
  if(contadorExplosionAndroide <= 20 && explotandoDron == true){
    if(contadorExplosionAndroide >= 15 && contadorExplosionAndroide < 20){ image(explosion4, xDron + 150, 25, 100, 100); }
    if(contadorExplosionAndroide >= 10 && contadorExplosionAndroide < 15){ image(explosion3, xDron + 150, 25, 100, 100); }
    if(contadorExplosionAndroide >= 5 && contadorExplosionAndroide < 10){ image(explosion2, xDron + 150, 25, 100, 100); }
    if(contadorExplosionAndroide >= 0 && contadorExplosionAndroide < 5){ image(explosion1, xDron + 150, 25, 100, 100); }
    contadorExplosionAndroide = contadorExplosionAndroide + 1;
  }else{
    explotandoDron = false;
    contadorExplosionAndroide = 0;
  }
  
  //Textos de colisiones en pantalla
  //Androide
  //Avisar que el Dron golpeo al Androide
  if(disparandoDron == false && llegoFinalProyectilDron == true && entroAndroide < 50 && vidaAndroide >= 0){
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    text("El misil golpeó al Androide", 200, 340);
    entroDron = 50;
    entroAndroide = entroAndroide + 1;
  }
  //Generar y escribir el mensaje de vida de las vidas del Androide
  if(vidaAndroide > -1){
      vida1 = "          x" + vidaAndroide;
  }
  fill(255, 255, 255); textSize(20); textFont(fuente2);
  text("Vida del Androide: " + vida1, 25, 735);
  image(corazon, 180, 680, 100, 100); //Imagen del corazón
  //Matar al Androide y mostrar mensaje de muerte
  if(vidaAndroide == 0){
    contadorAndroide = 26;
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    text("¡¡El Androide ha sido destruido!!", 140, 400);
    //Aquí mostrar el botón de reiniciar
  }
  
  //Dron
  //Avisar que el Androide golpeo al Dron
  if(disparandoAndroide == false && llegoFinalProyectilAndroide == true && entroDron < 50 && vidaDron >= 0){
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    text("El disparo golpeó al Dron", 210, 340);
    entroAndroide = 50;
    entroDron = entroDron + 1;
  }
  //Generar y escribir el mensaje de vida de las vidas del Dron
  if(vidaDron > -1){
      vida2 = "          x" + vidaDron;
  }
  fill(255, 255, 255); textSize(20); textFont(fuente2);
  text("Vida del Dron: " + vida2, 1033, 735);
  image(procesador, 1178, 705, 45, 45); //Imagen del corazón
  //Matar al Dron y mostrar mensaje de muerte
  if(vidaDron == 0){
    yDron = yDron + 5;
    contadorDron = 41;
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    text("¡¡El Dron ha sido destruido!!", 196, 400);
    //Aquí mostrar el botón de reiniciar
  }
  
  
  //Menu reiniciar
  if(vidaDron == 0 || vidaAndroide == 0){
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    image(reset, 440, 460, 400, 150);  
  }
  
}

void mousePressed() {
  //Activar Proyectil del Dron
  if(mouseX < xDron + 400 && mouseX > xDron && mouseY > 30 && mouseY < 150 && clicDron == 0 && contadorDron != 41){//Verifica que se esté dando clic en el dron
    contadorDron = 21; //Acceder a la animación de disparo
    velocidad = 0;  
    clicDron = clicDron + 1;
    disparandoDron = true;
    llegoFinalProyectilDron = false; 
    proyectilDronY = 150; //Hacer que parezca debajo del dron
    proyectilDronX = xDron + 200; //Posición donde está el dron en eje x + la mitad de ancho del dron para que el proyectil salga de en medio
  }else{
    if(mouseX < xDron + 400 && mouseX > xDron && mouseY > 30 && mouseY < 150 && clicDron != 0 && contadorDron != 41){//Verifica que se esté dando clic en el dron
      contadorDron = 21; //Acceder a la animación de disparo
    }
  }
  
  //Activar Proyectil del Androide
  if(mouseX < xAndroide + 260 && mouseX > xAndroide && mouseY > 480 && mouseY < 740 && clicAndroide == 0 && contadorAndroide != 26){ //Verifica que se esté dando clic en el Androide
    contadorAndroide = 21; 
    disparandoAndroide = true;
    llegoFinalProyectilAndroide = false; 
    clicAndroide = clicAndroide + 1;
    proyectilAndroideY = 605; 
    proyectilAndroideX = xAndroide + 100;
    velocidadProyectilAndroideX = 13; 
    velocidadProyectilAndroideY = 33;     
    if(direccionAndroide== true){//se tira a la derecha
      direccionDisparoAndroide = true;
    }else{// Se tira a la izquierda   
      direccionDisparoAndroide = false;
    }
  }else{
    if(mouseX < xAndroide + 260 && mouseX > xAndroide && mouseY > 480 && mouseY < 740 && clicAndroide != 0 && contadorAndroide != 26){//Verifica que se esté dando clic en el dron
      contadorAndroide = 21; //Acceder a la animación de disparo
    }
  }
  //print("Se cliqueó en X: " + mouseX + " - Y: " + mouseY +"\n");
  
  //Menu reiniciar
  if(vidaDron == 0 || vidaAndroide == 0){
    //configuración Androide
    vida1 = "";
    vidaAndroide = 3;
    contadorAndroide = 0; //Contador para renderizar frames del Androide
    velocidadAndroide = 5;
    
    //configuración Dron
    vida2 = "";
    velocidadDron = 7; ////Velocidad del Dron
    vidaDron = 3; //Vidas del Dron
    contadorDron = 0; //Contador para renderizar frames del Dron  
   
  }
}

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
PImage dron1, dron2, dron3, dron4, dron5, androide1, androide2, androide3, androide4, androide5, androide6, androide7, explosion1, explosion2, explosion3, explosion4, misil, corazon, fondo; //Variables de Imágenes
PFont fuente1, fuente2; //Variables de las fuentes

//Configuración Fondo
int xFondo1 = 0; //Fondo NO. 1 para formar el efecto Parallax
int xFondo2 = -1280; //Fondo NO. 2 para formar el efecto Parallax

//Configuración Androide
float xAndroide; //Posición x del Androide
float velocidadAndroide = 5; //Velocidad del Androide
boolean direccionAndroide = true; //Saber hacía que dirección se mueve el Androide, true = derecha, false = izquierda
int vidaAndroide = 5; //Vida del Androide
int contadorAndroide = 0; //Contador para renderizar frames del Androide
String vida; //Variable de la vida del Androide

//configuración Dron
float xDron = 1080; //Posición x del Dron
float velocidadDron = 7; ////Velocidad del Dron
int contadorDron = 0; //Contador para renderizar frames del Dron

//Configuración Proyectil de Dron
boolean disparando = false; //Variable para saber si el Dron ha disparado
boolean llegoFinalProyectil = false; //Variable para saber si el Proyectil llego al final
boolean explotando = false; //Variable para conocer si el misil sigue explotando
int entro = 0; //Variable para dejar un rato los mensajes
int clic = 0; //Variable para saber si el Proyectil sigue cayendo
int contadorExplosion = 0; //Contador para renderizar frames de la Explosión
float proyectilY; //Posición y del Proyectil
float proyectilX; //Posición x del Proyectil
float velocidad = 0; //Velocidad del Proyectil
final float gravedad = 0.98; //Gravedad para el Proyectil

//Configuración del programa
void settings() {
  //fullScreen(); //Pantalla completa
  size(1280, 800); //Tamaño de la ventana, lienzo
}

//Iniciar el programa
void setup(){
  corazon = loadImage("./images/Corazon.png"); //Cargar la imagen del Corazón
  misil = loadImage("./images/Misil.png"); //Cargar la imagen del Misil
  explosion1 = loadImage("./images/Explosion1.png"); //Cargar un frame de la Explosión
  explosion2 = loadImage("./images/Explosion2.png"); //Cargar un frame de la Explosión
  explosion3 = loadImage("./images/Explosion3.png"); //Cargar un frame de la Explosión
  explosion4 = loadImage("./images/Explosion4.png"); //Cargar un frame de la Explosión
  dron1 = loadImage("./images/Dron_Movimiento1.png"); //Cargar un frame del Dron
  dron2 = loadImage("./images/Dron_Movimiento2.png"); //Cargar un frame del Dron
  dron3 = loadImage("./images/Dron_Movimiento3.png"); //Cargar un frame del Dron
  dron4 = loadImage("./images/Dron_Ataca.png"); //Cargar un frame del Dron cuando va a atacar
  dron5 = loadImage("./images/Dron_Disparo.png"); //Cargar un frame del Dron cuando dispara
  androide1 = loadImage("./images/Androide_Movimiento1.png"); //Cargar la imagen del Androide
  androide2 = loadImage("./images/Androide_Movimiento2.png"); //Cargar la imagen del Androide
  androide3 = loadImage("./images/Androide_Movimiento3.png"); //Cargar la imagen del Androide
  androide4 = loadImage("./images/Androide_Movimiento4.png"); //Cargar la imagen del Androide
  androide5 = loadImage("./images/Androide_Movimiento5.png"); //Cargar la imagen del Androide
  androide6 = loadImage("./images/Androide_Movimiento6.png"); //Cargar la imagen del Androide
  androide7 = loadImage("./images/Androide_Muerte.png"); //Cargar la imagen del Androide cuando muere
  fondo = loadImage("./images/Background1.jpg"); //Cargar la imagen del Fondo
  fondo.resize(1280, 800); //Redimensionar cualquier fondo a la escala del lienzo
  fuente1 = createFont("./fonts/Avalors.otf", 40); //Cargar la fuente de los misilazos
  fuente2 = createFont("./fonts/Dead.otf", 20); //Cargar la fuente de las vidas
}

void draw(){
  image(fondo, xFondo1, 0);
  image(fondo, xFondo2, 0);
  xFondo1 = xFondo1 + 1; //Velocidad con la que se mueve la primera imagen del efecto Parallax del fondo
  if(xFondo1 == 1280){ //Cuando llega al borde de la pantalla se restablece la posición
    xFondo1 = -1280;
  }
  xFondo2 = xFondo2 + 1; //Velocidad con la que se mueve la segunda imagen del efecto Parallax del fondo
  if(xFondo2 == 1280){ //Cuando llega al borde de la pantalla se restablece la posición
    xFondo2 = -1280;
  }

  //Movimiento de la dirección del Androide
  //xAndroide = 40; //quitar, es solo para pruebas
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
  if(contadorAndroide == 21){ image(androide7, xAndroide, 480, 260, 260); velocidadAndroide = 0;}
  if(contadorAndroide == 20){ contadorAndroide = 0; }
  if((contadorAndroide >= 10 && contadorAndroide < 15) && direccionAndroide == true){ image(androide3, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 10 && contadorAndroide < 15) && direccionAndroide == false){ image(androide6, xAndroide, 480, 260, 260); }
  if(((contadorAndroide >= 5 && contadorAndroide < 10) || (contadorAndroide >= 15 && contadorAndroide < 20)) && direccionAndroide == true){ image(androide2, xAndroide, 480, 260, 260); }
  if(((contadorAndroide >= 5 && contadorAndroide < 10) || (contadorAndroide >= 15 && contadorAndroide < 20)) && direccionAndroide == false){ image(androide5, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 0 && contadorAndroide < 5) && direccionAndroide == true){ image(androide1, xAndroide, 480, 260, 260); }
  if((contadorAndroide >= 0 && contadorAndroide < 5) && direccionAndroide == false){ image(androide4, xAndroide, 480, 260, 260); }
  contadorAndroide = contadorAndroide + 1;
  
  //Movimiento del Dron
  xDron = xDron - velocidadDron;
  if(xDron <= (0 - 200)){ //Cuando llega al borde, se mueve al otro lado
    xDron = displayWidth - 200;
  }

  //Renderizar por frames al Dron
  if(contadorDron == 40){ contadorDron = 0; }
  if(contadorDron >= 25 && contadorDron < 35){ image(dron5, xDron, -100, 400, 400); }
  if((contadorDron >= 21 && contadorDron < 25) || (contadorDron >= 35 && contadorDron < 40)){ image(dron4, xDron, -100, 400, 400); }
  if(contadorDron == 20){ contadorDron = 0; }
  if(contadorDron >= 10 && contadorDron < 15){ image(dron3, xDron, -96, 400, 400); }
  if((contadorDron >= 5 && contadorDron < 10) || (contadorDron >= 15 && contadorDron < 20)){ image(dron2, xDron, -100, 400, 400); }
  if(contadorDron >= 0 && contadorDron < 5){ image(dron1, xDron, -100, 400, 400); }
  contadorDron = contadorDron + 1;
  
  //Proyectil Dron  
  if(disparando){
    //Verificar si el Proyectil aun se encuentra cayendo
    if(llegoFinalProyectil == false){
      velocidad = velocidad + gravedad;
      proyectilY = proyectilY + velocidad; 
      image(misil, proyectilX - 50, proyectilY - 30, 70, 70); //Imagen del Proyectil
    }
    //Verificar si el Proyectil llego al final del lienzo
    if(proyectilY > height){                    
      llegoFinalProyectil = true;    
      clic = 0;
    }
    //Verificación de que el Proyectil sí interceptó a Androide
    if((proyectilX < xAndroide + 170 && proyectilX > xAndroide + 90) && (proyectilY > 540 && proyectilY < 700)){
      disparando = false;
      llegoFinalProyectil = true;
      explotando = true;
      vidaAndroide = vidaAndroide -1;
      entro = 0;
      clic = 0;
    }
  }
  
  //Renderizar frames de la Explosión
  if(contadorExplosion <= 20 && explotando == true){
    if(contadorExplosion >= 15 && contadorExplosion < 20){ image(explosion4, xAndroide + 80, 570, 100, 100); }
    if(contadorExplosion >= 10 && contadorExplosion < 15){ image(explosion3, xAndroide + 80, 570, 100, 100); }
    if(contadorExplosion >= 5 && contadorExplosion < 10){ image(explosion2, xAndroide + 80, 570, 100, 100); }
    if(contadorExplosion >= 0 && contadorExplosion < 5){ image(explosion1, xAndroide + 80, 570, 100, 100); }
    contadorExplosion = contadorExplosion + 1;
  }else{
    explotando = false;
    contadorExplosion = 0;
  }
  
  //Avisar que el Dron golpeo al Androide
  if(disparando == false && llegoFinalProyectil == true && entro < 50 && vidaAndroide > -1){
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    text("El misil golpeó al Androide", 200, 340);
    entro = entro + 1;
  }
  
  //Generar y escribir el mensaje de vida de las vidas del Androide
  if(vidaAndroide > -1){
      vida = "          x" + vidaAndroide;
  }
  fill(255, 255, 255); textSize(20); textFont(fuente2);
  text("Vida del Androide: " + vida, 25, 735);
  image(corazon, 180, 680, 100, 100); //Imagen del corazón
  
  //Matar al Androide y mostrar mensaje de muerte
  if(vidaAndroide == 0){
    contadorAndroide = 21;
    fill(255, 0, 0); textSize(40); textFont(fuente1);
    text("¡¡El Androide ha sido destruido!!", 140, 400);
    //Aquí mostrar el botón de reiniciar
  }
}

void mousePressed() {
  //Activar Proyectil de Dron
  if(mouseX < xDron + 400 && mouseX > xDron && mouseY > 30 && mouseY < 150 && clic == 0){//Verifica que se esté dando clic en el dron
    contadorDron = 21; //Acceder a la animación de disparo
    velocidad = 0;  
    clic = clic + 1;
    disparando = true;
    llegoFinalProyectil = false; 
    proyectilY = 150; //Hacer que parezca debajo del dron
    proyectilX = xDron + 200; //Posición donde está el dron en eje x + la mitad de ancho del dron para que el proyectil salga de en medio
  }else{
    contadorDron = 21; //Acceder a la animación de disparo
  }
  print("PROYECTIL: Se cliqueó en X: " + mouseX + " - Y: " + mouseY +"\n");
}

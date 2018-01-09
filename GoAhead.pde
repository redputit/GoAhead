/*

ロケットの大きさ　拡大と縮小
カメラワークの拡大と縮小
まわってるやつの速度UP
スピード上がるエリアリング
回転のあたり判定

*/

/* library */
import java.util.HashMap;
import java.util.Map;
import java.util.Arrays;
import ddf.minim.*;

/* game arrays */
//オブジェクト管理
ArrayList<Object> objects;
//playeradress
ArrayList<Field> fields; 
Stage stage;

/* system */
//pressflag
boolean isMousePressed;
//cameras
float CameraX = 0, CameraY = 0;
float preCameraX, preCameraY;

/* materials */
//icon配列
HashMap<String, PImage> icons;
//layer
HashMap<String, PGraphics> layers;
//font
PFont font;
//sound
Minim minim;
HashMap<String, AudioPlayer> sounds;

void setup() {
  size(480, 360);
  
  String path = "data/";
  String[][] imageFiles = new String[][] {
      {"ROCKET", "rocket.png"},
      {"ROCKET_GOLD", "rocket2.png"},
      {"MOON", "moon.png"},
      {"HEART_FILL", "heart.png"},
      {"HEART_EMPTY", "heart2.png"},
      {"ITEM_REPAIR", "item.png"},
      {"ITEM_BULLET", "item2.png"},
      {"ROCK_1", "rock.png"},
      {"ROCK_2", "rock2.png"},
      {"ROCK_3", "rock3.png"},
      {"BULLET", "bullet.png"}
    };
  
  icons = new HashMap<String, PImage>();
  for(int n = 0; n < imageFiles.length; n++) {
    icons.put(imageFiles[n][0], loadImage(path + imageFiles[n][1]));
  }
  
  
  String[][] soundFiles = new String[][] {
      {"ECHO_1", "echo.mp3"},
      {"ECHO_2", "echo2.mp3"},
      {"ECHO_3", "echo3.mp3"},
      {"ITEM", "pick.mp3"},
      {"BOMB_1", "001.mp3"},
      {"BOMB_2", "002.mp3"},
      {"BOMB_3", "003.mp3"},
      {"BOMB_4", "004.mp3"},
      {"BOMB_5", "005.mp3"},
      {"BOMB_6", "006.mp3"}
    };
    
  minim = new Minim(this);
  sounds = new HashMap<String, AudioPlayer>();
  for(int n = 0; n < soundFiles.length; n++) {
    sounds.put(soundFiles[n][0], minim.loadFile(path + soundFiles[n][1]));
  }
  
  layers = new HashMap<String, PGraphics>();
  layers.put("UI", createGraphics(width, height));
  
  font = loadFont(path + "Molot-48.vlw");
  
  
  fields = new ArrayList<Field>();
  
  //debug
  stage = new Stage();
  fields.add(stage);
  stage.Init();
}
//
//  QuestionBank.swift
//  flashCards
//
//  Created by Misael Rivera on 12/12/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

class QuestionBank {
    private var bathroom1:WordsBankStruck!
    
    private var partsOfTheBody:WordsBankStruck!
    private var partsOfTheBody2:WordsBankStruck!
    
    private var clothing:WordsBankStruck!
    private var clothing2:WordsBankStruck!
    private var clothing3:WordsBankStruck!
    
    
    private var fruits:WordsBankStruck!
    private var fruits2:WordsBankStruck!
    private var vegetables:WordsBankStruck!
    private var vegetables2:WordsBankStruck!
    
    private var feelings:WordsBankStruck!
    private var feelings2:WordsBankStruck!
    
    private var partsOfTheHouse:WordsBankStruck!
    private var partsOfTheHouse2:WordsBankStruck!
    
    private var kitchen:WordsBankStruck!
    private var kitchen2:WordsBankStruck!
    
    private var foods:WordsBankStruck!
    
    private var animals:WordsBankStruck!
    private var animals2:WordsBankStruck!
    private var animals3:WordsBankStruck!
    private var animals4:WordsBankStruck!
    
    private var school:WordsBankStruck!
    private var school2:WordsBankStruck!
    private var school3:WordsBankStruck!
    
    
    
    var bank = [SectionBank]()
    
    init() {
        //baño
        bathroom1 = WordsBankStruck(section: "cosas del baño 1", wordsArrayPhone:[WordsInPhone(word: "bath", translate: "bañera"),
                                                                                  WordsInPhone(word: "hairbrush", translate: "cepillo"),
                                                                                  WordsInPhone(word: "hair dryer", translate: "secador de pelo"),
                                                                                  WordsInPhone(word: "sink", translate: "lavamanos"),
                                                                                  WordsInPhone(word: "soap", translate: "jabón"),
                                                                                  WordsInPhone(word: "toilet", translate: "inodoro"),
                                                                                  WordsInPhone(word: "toilet paper", translate: "papel higiénico"),
                                                                                  WordsInPhone(word: "towel", translate: "toalla"),
                                                                                  WordsInPhone(word: "mirror", translate: "espejo"),
                                                                                  WordsInPhone(word: "shampoo", translate: "champú"),
                                                                                  WordsInPhone(word: "shower", translate: "ducha"),
                                                                                  WordsInPhone(word: "lotion", translate: "loción"),
                                                                                  WordsInPhone(word: "Hot water tap", translate: "Llave de agua caliente"),
                                                                                  WordsInPhone(word: "floss", translate: "hilo dental"),
                                                                                  WordsInPhone(word: "Cold water tap", translate: "Llave de agua fria")])
        //partes del cuerpo
        partsOfTheBody = WordsBankStruck(section: "Partes del cuerpo", wordsArrayPhone:[ WordsInPhone(word: "hip", translate: "cadera"),
                                                                                         WordsInPhone(word: "waist", translate: "cintura"),
                                                                                         WordsInPhone(word: "side", translate: "costado"),
                                                                                         WordsInPhone(word: "rib", translate: "costilla"),
                                                                                         WordsInPhone(word: "back", translate: "espalda"),
                                                                                         WordsInPhone(word: "spine", translate: "columna vertebral"),
                                                                                         WordsInPhone(word: "belly button", translate: "ombligo"),
                                                                                         WordsInPhone(word: "chest", translate: "pecho"),
                                                                                         WordsInPhone(word: "skin", translate: "piel"),
                                                                                         WordsInPhone(word: "shoulder", translate: "hombro"),
                                                                                         WordsInPhone(word: "arms", translate: "brazos"),
                                                                                         WordsInPhone(word: "hand", translate: "mano"),
                                                                                         WordsInPhone(word: "elbow", translate: "codo"),
                                                                                         WordsInPhone(word: "finger", translate: "dedo de la mano "),
                                                                                         WordsInPhone(word: "wrist", translate: "muñeca")])
        
        
        partsOfTheBody2 = WordsBankStruck(section: "Partes del cuerpo II", wordsArrayPhone: [ WordsInPhone(word: "neck", translate: "cuello"),
                                                                                              WordsInPhone(word: "fist", translate: "puño"),
                                                                                              WordsInPhone(word: "artery", translate: "arteria"),
                                                                                              WordsInPhone(word: "liver", translate: "hígado"),
                                                                                              WordsInPhone(word: "bone", translate: "hueso"),
                                                                                              WordsInPhone(word: "muscle", translate: "músculo"),
                                                                                              WordsInPhone(word: "nerve", translate: "nervio"),
                                                                                              WordsInPhone(word: "lung", translate: "pulmón"),
                                                                                              WordsInPhone(word: "kidneys", translate: "riñones"),
                                                                                              WordsInPhone(word: "blood", translate: "sangre"),
                                                                                              WordsInPhone(word: "vein", translate: "vena"),
                                                                                              WordsInPhone(word: "heart", translate: "corazón"),
                                                                                              WordsInPhone(word: "stomach", translate: "estómago"),
                                                                                              WordsInPhone(word: "cheek", translate: "mejilla"),
                                                                                              WordsInPhone(word: "eyebrow", translate: "ceja")])
             //diente/dientes: tooth/teeth ,encías: gums ,labio: lip ,párpado: eyelid ,pestaña: eyelash ,mandíbula: jaw ,frente: forehead ,barbilla: chin ,boca: mouth = 9
        
        //ropa
        clothing = WordsBankStruck(section: "Ropa I", wordsArrayPhone: [WordsInPhone(word: "T-shirt", translate: "camiseta"),
                                                                            WordsInPhone(word: "sweater", translate: "jersey"),
                                                                            WordsInPhone(word: "jacket", translate: "chaqueta"),
                                                                            WordsInPhone(word: "coat", translate: "abrigo"),
                                                                            WordsInPhone(word: "jeans", translate: "pantalones vaqueros"),
                                                                            WordsInPhone(word: "socks", translate: "calcetines"),
                                                                            WordsInPhone(word: "shorts", translate: "pantalón corto"),
                                                                            WordsInPhone(word: "tracksuit", translate: "chándal"),
                                                                            WordsInPhone(word: "vest", translate: "chaleco"),
                                                                            WordsInPhone(word: "pyjamas", translate: "pijama"),
                                                                            WordsInPhone(word: "shoes", translate: "zapatos"),
                                                                            WordsInPhone(word: "boots", translate: "botas"),
                                                                            WordsInPhone(word: "raincoat", translate: "gabardina"),
                                                                            WordsInPhone(word: "tanktop", translate: "camiseta sin mangas"),
                                                                            WordsInPhone(word: "swimsuit", translate: "traje de baño")])
        
        clothing2 = WordsBankStruck(section: "Ropa de mujer", wordsArrayPhone: [WordsInPhone(word: "skirt", translate: "falda"),
                                                                            WordsInPhone(word: "dress", translate: "vestido"),
                                                                            WordsInPhone(word: "heels", translate: "tacones"),
                                                                            WordsInPhone(word: "blouse", translate: "blusa"),
                                                                            WordsInPhone(word: "bra", translate: "sujetador"),
                                                                            WordsInPhone(word: "panties", translate: "bragas"),
                                                                            WordsInPhone(word: "stockings", translate: "medias"),
                                                                            WordsInPhone(word: "bikini", translate: "bikini"),
                                                                            WordsInPhone(word: "boots", translate: "botas"),
                                                                            WordsInPhone(word: "bra", translate: "sostén"),
                                                                            WordsInPhone(word: "Tank top", translate: "Camiseta de tiras"),
                                                                            WordsInPhone(word: "Strapless top", translate: "Camiseta sin mangas"),
                                                                            WordsInPhone(word: "Tight top", translate: "Camiseta apretada"),
                                                                            WordsInPhone(word: "Loose top", translate: "Camiseta grande"),
                                                                            WordsInPhone(word: "boots", translate: "botas")])
        
        clothing3 = WordsBankStruck(section: "Accesorios", wordsArrayPhone: [WordsInPhone(word: "wool hat", translate: "gorro de lana"),
                                                                             WordsInPhone(word: "scarf", translate: "bufanda"),
                                                                             WordsInPhone(word: "glasses", translate: "gafas"),
                                                                             WordsInPhone(word: "sunglasses", translate: "gafas de sol"),
                                                                             WordsInPhone(word: "bag", translate: "mochila"),
                                                                             WordsInPhone(word: "earrings", translate: "zarcillos"),
                                                                             WordsInPhone(word: "bracelet", translate: "pulsera"),
                                                                             WordsInPhone(word: "belt", translate: "cinturón"),
                                                                             WordsInPhone(word: "handkerchief", translate: "pañuelo"),
                                                                             WordsInPhone(word: "necklace", translate: "collar"),
                                                                             WordsInPhone(word: "purse", translate: "cartera"),
                                                                             WordsInPhone(word: "wallet", translate: "billetera"),
                                                                             WordsInPhone(word: "hat", translate: "sombrero"),
                                                                             WordsInPhone(word: "ring", translate: "anillo"),
                                                                             WordsInPhone(word: "watch", translate: "reloj de pulsera")])
        //fruits and vegetables
        fruits = WordsBankStruck(section: "Frutas", wordsArrayPhone: [ WordsInPhone(word: "grapes", translate: "uvas"),
                                                                       WordsInPhone(word: "lime", translate: "lima"),
                                                                       WordsInPhone(word: "lemon", translate: "limón"),
                                                                       WordsInPhone(word: "cherry", translate: "cereza"),
                                                                       WordsInPhone(word: "blueberry", translate: "arándano"),
                                                                       WordsInPhone(word: "banana", translate: "plátano"),
                                                                       WordsInPhone(word: "apple", translate: "manzana"),
                                                                       WordsInPhone(word: "watermelon", translate: "sandía"),
                                                                       WordsInPhone(word: "peach", translate: "melocotón"),
                                                                       WordsInPhone(word: "pineapple", translate: "piña"),
                                                                       WordsInPhone(word: "strawberry", translate: "fresa"),
                                                                       WordsInPhone(word: "orange", translate: "naranja"),
                                                                       WordsInPhone(word: "coconut", translate: "coco"),
                                                                       WordsInPhone(word: "pear", translate: "pera"),
                                                                       WordsInPhone(word: "apricot", translate: "albaricoque")
            ])
        fruits2 = WordsBankStruck(section: "Frutas II", wordsArrayPhone: [ WordsInPhone(word: "avocado", translate: "aguacate"),
                                                                       WordsInPhone(word: "blackberry", translate: "zarzamora"),
                                                                       WordsInPhone(word: "grapefruit", translate: "pomelo"),
                                                                       WordsInPhone(word: "kiwi", translate: "kiwi"),
                                                                       WordsInPhone(word: "mango", translate: "mango"),
                                                                       WordsInPhone(word: "plum", translate: "ciruela"),
                                                                       WordsInPhone(word: "raspberry", translate: "frambuesa"),
                                                                       WordsInPhone(word: "pomegranate", translate: "granada"),
                                                                       WordsInPhone(word: "fig", translate: "higo"),
                                                                       WordsInPhone(word: "passion fruit", translate: "maracuyá"),
                                                                       WordsInPhone(word: "tangerine", translate: "mandarina"),
                                                                       WordsInPhone(word: "orange", translate: "naranja"),
                                                                       WordsInPhone(word: "coconut", translate: "coco"),
                                                                       WordsInPhone(word: "melon", translate: "Melón"),
                                                                       WordsInPhone(word: "watermelon", translate: "Sandía")])
        
        vegetables = WordsBankStruck(section: "Verduras", wordsArrayPhone: [ WordsInPhone(word: "carrot", translate: "zanahoria"),
                                                                               WordsInPhone(word: "broccoli", translate: "brócoli"),
                                                                               WordsInPhone(word: "asparagus", translate: "espárragos"),
                                                                               WordsInPhone(word: "cauliflower", translate: "coliflor"),
                                                                               WordsInPhone(word: "corn", translate: "maíz"),
                                                                               WordsInPhone(word: "cucumber", translate: "pepino"),
                                                                               WordsInPhone(word: "eggplant", translate: "berenjena"),
                                                                               WordsInPhone(word: "green pepper", translate: "pimiento verde"),
                                                                               WordsInPhone(word: "lettuce", translate: "lechuga"),
                                                                               WordsInPhone(word: "mushrooms", translate: "champiñones"),
                                                                               WordsInPhone(word: "onion", translate: "cebolla"),
                                                                               WordsInPhone(word: "potato", translate: "papa"),
                                                                               WordsInPhone(word: "pumpkin", translate: "calabaza"),
                                                                               WordsInPhone(word: "red pepper", translate: "pimiento rojo"),
                                                                               WordsInPhone(word: "tomato", translate: "tomate")])
        
        vegetables2 = WordsBankStruck(section: "Verduras II", wordsArrayPhone: [WordsInPhone(word: "radish", translate: "rábano"),
                                                                                  WordsInPhone(word: "artichoke", translate: "alcachofa"),
                                                                                  WordsInPhone(word: "cabbage", translate: "repollo"),
                                                                                  WordsInPhone(word: "celery", translate: "apio"),
                                                                                  WordsInPhone(word: "chili", translate: "chile"),
                                                                                  WordsInPhone(word: "garlic", translate: "ajo"),
                                                                                  WordsInPhone(word: "basil", translate: "albahaca"),
                                                                                  WordsInPhone(word: "coriander", translate: "cilantro"),
                                                                                  WordsInPhone(word: "parsley", translate: "perejil"),
                                                                                  WordsInPhone(word: "rosemary", translate: "romero"),
                                                                                  WordsInPhone(word: "oregano", translate: "orégano"),
                                                                                  WordsInPhone(word: "cinnamon", translate: "canela"),
                                                                                  WordsInPhone(word: "bean", translate: "lenteja"),
                                                                                  WordsInPhone(word: "chickpea", translate: "frijol"),
                                                                                  WordsInPhone(word: "lentil", translate: "garbanzo")])
        //sentimientos
        feelings = WordsBankStruck(section: "Sentimientos", wordsArrayPhone: [WordsInPhone(word: "happiness", translate: "felicidad"),
                                                                          WordsInPhone(word: "happy", translate: "feliz"),
                                                                          WordsInPhone(word: "sadness", translate: "tristeza"),
                                                                          WordsInPhone(word: "sad", translate: "triste"),
                                                                          WordsInPhone(word: "anger", translate: "rabia"),
                                                                          WordsInPhone(word: "angry", translate: "enojado"),
                                                                          WordsInPhone(word: "fear", translate: "miedo"),
                                                                          WordsInPhone(word: "scared", translate: "asustado"),
                                                                          WordsInPhone(word: "surprise", translate: "sorpresa"),
                                                                          WordsInPhone(word: "surprised", translate: "sorprendido"),
                                                                          WordsInPhone(word: "joy", translate: "alegría"),
                                                                          WordsInPhone(word: "calmness", translate: "calma"),
                                                                          WordsInPhone(word: "confusion", translate: "confusión"),
                                                                          WordsInPhone(word: "boredom", translate: "aburrimiento"),
                                                                          WordsInPhone(word: "in love", translate: "enamorado")])
        
        feelings2 = WordsBankStruck(section: "Sentimientos II", wordsArrayPhone: [   WordsInPhone(word: "sympathy", translate: "simpatía"),
                                                                                 WordsInPhone(word: "nostalgia", translate: "nostalgia"),
                                                                                 WordsInPhone(word: "triumph", translate: "triunfo"),
                                                                                 WordsInPhone(word: "courage", translate: "coraje"),
                                                                                 WordsInPhone(word: "envy", translate: "envidia"),
                                                                                 WordsInPhone(word: "satisfaction", translate: "satisfacción"),
                                                                                 WordsInPhone(word: "kindness", translate: "bondad"),
                                                                                 WordsInPhone(word: "determination", translate: "determinación"),
                                                                                 WordsInPhone(word: "loneliness", translate: "soledad"),
                                                                                 WordsInPhone(word: "optimism", translate: "optimismo"),
                                                                                 WordsInPhone(word: "amazement", translate: "asombro"),
                                                                                 WordsInPhone(word: "depressed", translate: "deprimido"),
                                                                                 WordsInPhone(word: "arrongant", translate: "arrogante"),
                                                                                 WordsInPhone(word: "hungry", translate: "hambriento"),
                                                                                 WordsInPhone(word: "clumsy", translate: "torpe")])
        
        //partes de la casa
        partsOfTheHouse = WordsBankStruck(section: "Partes de la casa", wordsArrayPhone: [ WordsInPhone(word: "house", translate: "casa"),
                                                                                            WordsInPhone(word: "cottage", translate: "cabaña"),
                                                                                            WordsInPhone(word: "window", translate: "ventana"),
                                                                                            WordsInPhone(word: "balcony", translate: "balcón"),
                                                                                            WordsInPhone(word: "ceiling", translate: "techo"),
                                                                                            WordsInPhone(word: "cornice", translate: "cornisa"),
                                                                                            WordsInPhone(word: "corridor", translate: "corredor"),
                                                                                            WordsInPhone(word: "facade", translate: "fachada"),
                                                                                            WordsInPhone(word: "floor", translate: "piso"),
                                                                                            WordsInPhone(word: "fountain", translate: "fuente"),
                                                                                            WordsInPhone(word: "gallery", translate: "galería"),
                                                                                            WordsInPhone(word: "hallway", translate: "pasillo"),
                                                                                            WordsInPhone(word: "hall", translate: "sala"),
                                                                                            WordsInPhone(word: "room", translate: "habitación"),
                                                                                            WordsInPhone(word: "stairs", translate: "escaleras")])
        
        partsOfTheHouse2 = WordsBankStruck(section: "Partes de la casa II", wordsArrayPhone: [WordsInPhone(word: "elevator", translate: "ascensor"),
                                                                                               WordsInPhone(word: "rooftop", translate: "azotea"),
                                                                                               WordsInPhone(word: "wall", translate: "pared"),
                                                                                               WordsInPhone(word: "column", translate: "columna"),
                                                                                               WordsInPhone(word: "patio", translate: "patio"),
                                                                                               WordsInPhone(word: "door", translate: "puerta"),
                                                                                               WordsInPhone(word: "heating", translate: "calefacción"),
                                                                                               WordsInPhone(word: "air conditioning", translate: "aire acondicionado"),
                                                                                               WordsInPhone(word: "basement", translate: "sótano"),
                                                                                               WordsInPhone(word: "office building", translate: "edificio de oficinas"),
                                                                                               WordsInPhone(word: "factory", translate: "fábrica"),
                                                                                               WordsInPhone(word: "skyscraper", translate: "rascacielos"),
                                                                                               WordsInPhone(word: "manor", translate: "palacete"),
                                                                                               WordsInPhone(word: "mansion", translate: "mansión"),
                                                                                               WordsInPhone(word: "ranch", translate: "hacienda")])
        
        //cocina
        kitchen = WordsBankStruck(section: "Cocina", wordsArrayPhone: [WordsInPhone(word: "spoon", translate: "cuchara"),
                                                                         WordsInPhone(word: "fork", translate: "tenedor"),
                                                                         WordsInPhone(word: "knife", translate: "cuchillo"),
                                                                         WordsInPhone(word: "cup", translate: "taza"),
                                                                         WordsInPhone(word: "pan", translate: "sartén"),
                                                                         WordsInPhone(word: "plate", translate: "plato"),
                                                                         WordsInPhone(word: "stove", translate: "cocina"),
                                                                         WordsInPhone(word: "fridge", translate: "nevera"),
                                                                         WordsInPhone(word: "grill", translate: "parrilla"),
                                                                         WordsInPhone(word: "spatula", translate: "espátula"),
                                                                         WordsInPhone(word: "whisk", translate: "batidor"),
                                                                         WordsInPhone(word: "tongs", translate: "pinzas"),
                                                                         WordsInPhone(word: "ice cream scoop", translate: "cuchara de helado"),
                                                                         WordsInPhone(word: "biscuit cutter", translate: "molde para galletas"),
                                                                         WordsInPhone(word: "bottle opener", translate: "destapador")])
        
        
        kitchen2 = WordsBankStruck(section: "Cocina II ", wordsArrayPhone: [WordsInPhone(word: "cutting board", translate: "tabla de cortar"),
                                                                         WordsInPhone(word: "egg timer", translate: "temporizador para huevos"),
                                                                         WordsInPhone(word: "flour sifter", translate: "colador de harina"),
                                                                         WordsInPhone(word: "funnel", translate: "embudo"),
                                                                         WordsInPhone(word: "grater", translate: "rallador"),
                                                                         WordsInPhone(word: "measuring cup", translate: "taza para medir"),
                                                                         WordsInPhone(word: "meat grinder", translate: "molino de carne"),
                                                                         WordsInPhone(word: "pepper mill", translate: "molinillo de pimienta"),
                                                                         WordsInPhone(word: "pizza cutter", translate: "corta pizza"),
                                                                         WordsInPhone(word: "scale", translate: "balanza"),
                                                                         WordsInPhone(word: "tin opener", translate: "abrelatas"),
                                                                         WordsInPhone(word: "zester", translate: "rallador para frutas"),
                                                                         WordsInPhone(word: "slices", translate: "rebanadas"),
                                                                         WordsInPhone(word: "batter", translate: "mezcla"),
                                                                         WordsInPhone(word: "plate", translate: "plato")])
        //alimentos
        foods = WordsBankStruck(section: "Alimentos", wordsArrayPhone: [WordsInPhone(word: "salad", translate: "ensalada"),
                                                                    WordsInPhone(word: "bread", translate: "pan"),
                                                                    WordsInPhone(word: "sandwich", translate: "bocadillo"),
                                                                    WordsInPhone(word: "steak", translate: "filete"),
                                                                    WordsInPhone(word: "tuna steak", translate: "filete de atún"),
                                                                    WordsInPhone(word: "fish", translate: "pescado"),
                                                                    WordsInPhone(word: "chicken", translate: "pollo"),
                                                                    WordsInPhone(word: "rice", translate: "arroz"),
                                                                    WordsInPhone(word: "spaghetti", translate: "espagueti"),
                                                                    WordsInPhone(word: "pizza", translate: "pizza"),
                                                                    WordsInPhone(word: "hamburger", translate: "hamburguesa"),
                                                                    WordsInPhone(word: "eggs", translate: "huevos"),
                                                                    WordsInPhone(word: "cheese", translate: "queso"),
                                                                    WordsInPhone(word: "sausages", translate: "salchichas"),
                                                                    WordsInPhone(word: "milk", translate: "leche")])
        
        //animales
        animals = WordsBankStruck(section: "Animales", wordsArrayPhone: [WordsInPhone(word: "cockatoo", translate: "cacatúa"),
                                                                             WordsInPhone(word: "orangutan", translate: "orangután"),
                                                                             WordsInPhone(word: "water buffalo", translate: "búfalo de agua"),
                                                                             WordsInPhone(word: "bee", translate: "abeja"),
                                                                             WordsInPhone(word: "ant", translate: "hormiga"),
                                                                             WordsInPhone(word: "butterfly", translate: "mariposa"),
                                                                             WordsInPhone(word: "fly", translate: "mosca"),
                                                                             WordsInPhone(word: "cockroach", translate: "cucaracha"),
                                                                             WordsInPhone(word: "beetle", translate: "escarabajo"),
                                                                             WordsInPhone(word: "cicada", translate: "cigarra"),
                                                                             WordsInPhone(word: "grasshopper", translate: "saltamontes"),
                                                                             WordsInPhone(word: "moth", translate: "polilla"),
                                                                             WordsInPhone(word: "wasp", translate: "avispa"),
                                                                             WordsInPhone(word: "dragonfly", translate: "libélula"),
                                                                             WordsInPhone(word: "cricket", translate: "grillo")])
        
        animals2 = WordsBankStruck(section: "Animales II", wordsArrayPhone: [WordsInPhone(word: "polar bear", translate: "oso polar"),
                                                                            WordsInPhone(word: "seal", translate: "foca"),
                                                                            WordsInPhone(word: "reindeer", translate: "reno"),
                                                                            WordsInPhone(word: "walrus", translate: "morsa"),
                                                                            WordsInPhone(word: "sea otter", translate: "nutria marina"),
                                                                            WordsInPhone(word: "orca", translate: "orca"),
                                                                            WordsInPhone(word: "wolverine", translate: "carcayú"),
                                                                            WordsInPhone(word: "penguin", translate: "pingüino"),
                                                                            WordsInPhone(word: "owl", translate: "lechuza"),
                                                                            WordsInPhone(word: "dove", translate: "paloma"),
                                                                            WordsInPhone(word: "woodpecker", translate: "pájaro carpintero"),
                                                                            WordsInPhone(word: "crow", translate: "cuervo"),
                                                                            WordsInPhone(word: "sparrow", translate: "gorrión"),
                                                                            WordsInPhone(word: "hummingbird", translate: "colibrí"),
                                                                            WordsInPhone(word: "robin", translate: "petirrojo")])
        
        
        animals3 = WordsBankStruck(section: "Animales de agua", wordsArrayPhone: [WordsInPhone(word: "turtle", translate: "tortuga"),
                                                                                 WordsInPhone(word: "octopus", translate: "pulpo"),
                                                                                 WordsInPhone(word: "frog", translate: "rana"),
                                                                                 WordsInPhone(word: "whale", translate: "ballena"),
                                                                                 WordsInPhone(word: "crab", translate: "cangrejo"),
                                                                                 WordsInPhone(word: "clam", translate: "almeja"),
                                                                                 WordsInPhone(word: "fish", translate: "pez"),
                                                                                 WordsInPhone(word: "lobster", translate: "langosta"),
                                                                                 WordsInPhone(word: "shark", translate: "tiburón"),
                                                                                 WordsInPhone(word: "hippopotamus", translate: "hipopótamo"),
                                                                                 WordsInPhone(word: "sea horse", translate: "caballito de mar"),
                                                                                 WordsInPhone(word: "squid", translate: "calamar"),
                                                                                 WordsInPhone(word: "shrimp", translate: "camarón"),
                                                                                 WordsInPhone(word: "swan", translate: "cisne"),
                                                                                 WordsInPhone(word: "dolphin", translate: "delfín")])
        
        animals4 = WordsBankStruck(section: "Animales del desierto", wordsArrayPhone: [WordsInPhone(word: "fox", translate: "zorro"),
                                                                                WordsInPhone(word: "wild dog", translate: "perro salvaje"),
                                                                                WordsInPhone(word: "wildcat", translate: "gato salvaje"),
                                                                                WordsInPhone(word: "armadillo", translate: "armadillo"),
                                                                                WordsInPhone(word: "badger", translate: "tejón"),
                                                                                WordsInPhone(word: "black bear", translate: "oso negro"),
                                                                                WordsInPhone(word: "buffalo", translate: "búfalo"),
                                                                                WordsInPhone(word: "camel", translate: "camello"),
                                                                                WordsInPhone(word: "coyote", translate: "coyote"),
                                                                                WordsInPhone(word: "lion", translate: "león"),
                                                                                WordsInPhone(word: "elephant", translate: "elefante"),
                                                                                WordsInPhone(word: "cheetah", translate: "guepardo"),
                                                                                WordsInPhone(word: "hyena", translate: "hiena"),
                                                                                WordsInPhone(word: "gazelle", translate: "gacela"),
                                                                                WordsInPhone(word: "ostrich", translate: "avestruz")])
        
        //school
        school = WordsBankStruck(section: "El salon", wordsArrayPhone: [WordsInPhone(word: "blackboard", translate: "pizarra"),
                                                                        WordsInPhone(word: "backpack", translate: "mochila"),
                                                                        WordsInPhone(word: "book", translate: "libro"),
                                                                        WordsInPhone(word: "pencil", translate: "lápiz"),
                                                                        WordsInPhone(word: "crayons", translate: "ceras"),
                                                                        WordsInPhone(word: "ruler", translate: "regla"),
                                                                        WordsInPhone(word: "scissors", translate: "tijeras"),
                                                                        WordsInPhone(word: "whiteboard", translate: "pizarra blanca"),
                                                                        WordsInPhone(word: "chair", translate: "silla"),
                                                                        WordsInPhone(word: "desk", translate: "escritorio"),
                                                                        WordsInPhone(word: "pen", translate: "bolígrafo"),
                                                                        WordsInPhone(word: "eraser", translate: "borrador"),
                                                                        WordsInPhone(word: "clip", translate: "sujetapapeles"),
                                                                        WordsInPhone(word: "notebook", translate: "cuaderno"),
                                                                        WordsInPhone(word: "sharpener", translate: "sacapuntas")])
        
        school2 = WordsBankStruck(section: "El salon II", wordsArrayPhone: [ WordsInPhone(word: "pencil case", translate: "estuche"),
                                                                                  WordsInPhone(word: "glue", translate: "pegamento"),
                                                                                  WordsInPhone(word: "protractor", translate: "transportador"),
                                                                                  WordsInPhone(word: "compass", translate: "compás"),
                                                                                  WordsInPhone(word: "scotch tape/sellotape", translate: "cinta adhesiva"),
                                                                                  WordsInPhone(word: "stapler", translate: "grapadora"),
                                                                                  WordsInPhone(word: "paint brushes", translate: "pinceles"),
                                                                                  WordsInPhone(word: "palette", translate: "paleta"),
                                                                                  WordsInPhone(word: "paint", translate: "pintura"),
                                                                                  WordsInPhone(word: "globe", translate: "globo terráqueo"),
                                                                                  WordsInPhone(word: "map", translate: "mapa"),
                                                                                  WordsInPhone(word: "computer", translate: "computadora"),
                                                                                  WordsInPhone(word: "construction paper", translate: "cartulina"),
                                                                                  WordsInPhone(word: "dictionary", translate: "diccionario"),
                                                                                  WordsInPhone(word: "glossary", translate: "glosario")])
        
        school3 = WordsBankStruck(section: "Escuela", wordsArrayPhone: [WordsInPhone(word: "school", translate: "escuela"),
                                                                                  WordsInPhone(word: "teacher", translate: "maestro"),
                                                                                  WordsInPhone(word: "principal", translate: "director"),
                                                                                  WordsInPhone(word: "student", translate: "alumno"),
                                                                                  WordsInPhone(word: "mathematics", translate: "matemáticas"),
                                                                                  WordsInPhone(word: "arithmetics", translate: "aritmética"),
                                                                                  WordsInPhone(word: "languages", translate: "idiomas"),
                                                                                  WordsInPhone(word: "history", translate: "historia"),
                                                                                  WordsInPhone(word: "geography", translate: "geografía"),
                                                                                  WordsInPhone(word: "science", translate: "ciencia"),
                                                                                  WordsInPhone(word: "chemistry", translate: "química"),
                                                                                  WordsInPhone(word: "biology", translate: "biología"),
                                                                                  WordsInPhone(word: "physics", translate: "física"),
                                                                                  WordsInPhone(word: "physical education", translate: "educación física"),
                                                                                  WordsInPhone(word: "information technology", translate: "informática")])

        bank.append(SectionBank(seccion: "Partes del cuerpo", bankoWords: [partsOfTheBody,partsOfTheBody2]))
        bank.append(SectionBank(seccion: "Ropa y accesorios", bankoWords: [clothing,clothing2,clothing3]))
        bank.append(SectionBank(seccion: "Frutas y verduras", bankoWords: [fruits,fruits2,vegetables,vegetables2]))
        bank.append(SectionBank(seccion: "El baño", bankoWords: [bathroom1]))
        bank.append(SectionBank(seccion: "Sentimientos", bankoWords: [feelings,feelings2]))
        bank.append(SectionBank(seccion: "Partes de la casa", bankoWords: [partsOfTheHouse,partsOfTheHouse2]))
        bank.append(SectionBank(seccion: "La cocina", bankoWords: [kitchen,kitchen2]))
        bank.append(SectionBank(seccion: "Alimentos", bankoWords: [foods]))
        bank.append(SectionBank(seccion: "Animales", bankoWords: [animals,animals2,animals3,animals4]))
        bank.append(SectionBank(seccion: "Escuela", bankoWords: [school,school2,school3]))
    }
}

/*
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>),
 WordsInPhone(word: <#T##String#>, translate: <#T##String#>)

 */

/*
 adverbios de tiempo
 
 hourly - una vez por hora/cada hora
 daily - diariamente
 nightly - cada noche
 weekly - semanalmente
 monthly - mensualmente
 annually - anualmente
 yearly - cada año
 before - antes
 already - ya
 now - ahora
 today - hoy
 tonight - esta noche
 tomorrow - mañana
 yesterday - ayer
 first - primero
 
 next - enseguida
 since - desde entonces
 yet- ya/todavía
 still - aún
 soon - pronto
 just - sólo
 late - tarde
 earlier - más temprano
 */

/*
 adbervios de frecuencia
 always - siempre
 daily - diariamente
 eventually -eventualmente
 frequently - frecuentemente
 generally - generalmente
 hardly ever - casi nunca
 infrequently - con poca frecuencia
 never - nunca
 normally - normalmente
 occasionally - ocasionalmente
 often - con frecuencia
 usually - usualmente
 later - más tarde
 previously - previamente
 recently - recientemente
 */

/*
 adverbios de cantidad
 
 absolutely - absolutamente
 almost - casi
 barely - apenas
 completely - completamente
 deeply - profundamente
 enough - suficiente
 extremely - extremadamente
 fully - totalmente
 hardly - dificilmente least - lo mínimo
 less - menos
 little - un poco/algo
 most - la mayoría
 much - mucho
 positively - positivamente
 practically - prácticamente
 
 rather - bastante
 simply - simplemente
 so - tan
 somewhat - de alguna manera
 terribly - extremadamente/terriblemente
 too - demasiado
 utterly - completamente
 very - muy
 */

/*
 adverbios de modo
 
 abruptly - abruptamente
 angrily - furiosamente/con enojo
 badly - mal
 carefully - cuidadosamente
 easily - fácilmente
 fast - velozmente
 friendly - amistosamente
 gently - ligeramente/con cuidado
 happily - alegremente
 hard - fuerte
 heavily - considerablemente
 kindly - amablemente
 loudly - a todo volumen
 neatly - con esmero
 nicely - cordialmente
 
 politely - educadamente
 quickly - rápidamente
 quietly - silenciosamente
 sadly - desafortunadamente/tristemente
 secretly - secretamente
 slowly - lentamente
 softly - suavemente
 suddenly - repentinamente
 well - adecuadamente
 */

/*
 adverbios de lugar
 
 above- encima de
 around - alrededor de
 backward - hacia atrás
 behind - detrás de
 below - debajo de
 between - entre
 down - abajo
 east - hacia el este
 everywhere - en todos lados
 far away - lejos
 forward - hacia adelante
 here - aquí
 miles apart - a millas de distancia (a kilómetros de distancia)
 nearby - cerca
 north - hacia el norte
 
 outside - afuera
 south - hacia el sur
 there - allí
 up - hacia arriba
 west - hacia el oeste
 */

/*
 adjetivos descriptivos
 
 alta/o: tall
 baja/o: short
 joven: young
 vieja/o: old
 linda/o: pretty
 grande: big
 pequeña/o: small
 amistosa/o: friendly
 amable: nice
 Apariencia
 adorable: adorable
 preciosa/o: cute
 limpia/o: clean
 elegante: elegant
 sucia/o: dirty
 
 guapa/o: handsome
 bella/o: beautiful
 clara/o: clear
 
 
 Adjetivos de forma en inglés Adjetivos de tamaño en inglés Adjetivos de condición en inglés
 plana/o: flat
 alta/o: high
 hueca/o: hollow
 estrecha/o: narrow
 redonda/o: round
 cuadrada/o: square
 ancha/o: wide
 inmensa/o: immense
 pequeña/o: little
 diminuta/o: tiny
 enorme: huge
 masiva/o: massive
 equivocada/o: wrong
 útil: helpful
 mejor: better
 
 lista/o: clever
 famosa/o: famous
 fría/o: cold
 cálida/o: warm
 helada/o: chilly
 Adjetivos de sonido
 ruidosa/o: loud
 escandalosa/o: noisy
 tranquila/o: quiet
 áspera/o: raspy
 débil: faint
 amigable: friendly
 creativo: creative
 amable: kind
 entusiasta: cheerful
 
 aventurero: adventurous
 valiente: brave
 gracioso: funny
 honesto: honest
 */

/*
 clima
 
 frío: cold
 caliente: hot
 viento: wind
 lluvia: rain
 nieve: snow
 nube: cloud
 sol: sun
 arco iris: rainbow
 niebla: fog
 neblina: mist
 escarcha: frost
 llovizna: drizzle / showers
 inundación: flood
 aguacero: downpours
 granizo: hail
 
 aguanieve: sleet
 copo de nieve: snowflake
 brisa: breeze
 huracán: hurricane
 ciclón: cyclone
 tifón: typhoon
 tornado: tornado
 trueno: thunder
 sequía: drought
 predicción del tiempo: forecast
 relámpago: lightning
 bruma: haze
 granizo: hailstone
 tormenta de nieve: blizzard
 luz del sol: sunshine
 
 contaminación atmosférica: smog
 lluvia ligera: light rain
 lluvia fuerte: heavy rain
 
 
 Adjetivos para describir el clima
 
 soleado: sunny
 ventoso: windy
 tormentoso: stormy
 nevado: snowy
 húmedo: humid
 helado: chilly
 gris: gloomy
 brumoso: foggy / hazy
 despejado: clear
 cálido: warm
 con niebla: misty
 mojado: damp
 gélido: frosty
 glacial: icy
 */



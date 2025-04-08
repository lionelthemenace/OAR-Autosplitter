state("OAR-Win64-Shipping"){ //0000CB48
    int loadingEnded:"OAR-Win64-Shipping.exe",0x04C1A5C8,0x10,0x8,0x558; // Loading screen disappears
    string32 level:"OAR-Win64-Shipping.exe",0x04C1FAF0,0x58,0x30,0xF8,0x14; // Current level name
    int endTutorial:"OAR-Win64-Shipping.exe",0x04A49230,0x0,0x1D0; // Tutorial completion screen
    int endHeist:"OAR-Win64-Shipping.exe",0x04A572B8,0xA98; // Heist completion screen
}
init{
    vars.isTutorialLevel = false;
    vars.lastEndTutorial = 0;
    vars.lastEndHeist = 0;}
update{
    if (current.level != null && current.level != ""){
        vars.isTutorialLevel = current.level.Contains("Tutor");}
    if (current.endTutorial != vars.lastEndTutorial) {
        vars.lastEndTutorial = current.endTutorial;}
    if (current.endHeist != vars.lastEndHeist) {
        vars.lastEndHeist = current.endHeist;}}
start{
    if (current.loadingEnded > old.loadingEnded){
        return true;}
    return false;}
split{
    if (vars.isTutorialLevel){
        if (old.endTutorial > current.endTutorial) {
            return true;}
       }else{
        if (old.endHeist > current.endHeist) {
            return true;}}
    return false;}
reset{
    if (current.loadingEnded==0){
        return true;}
    return false;}

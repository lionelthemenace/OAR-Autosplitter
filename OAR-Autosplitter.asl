state("OAR-Win64-Shipping") //0000CB48
{
    int level: "OAR-Win64-Shipping.exe", 0x04C1A5C8, 0x10, 0x8, 0x558; //starts time when user inputs can be made
    int end: "OAR-Win64-Shipping.exe", 0x04A572B8, 0xC84; //splits on first frame of heist end screen
}
start {
    return (current.level > old.level);
}
split {
    return (current.end > old.end);
}
reset {
    return (current.level == 0);
}

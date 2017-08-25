module main;

import dsfml.graphics;
import dsfml.audio;
import std.stdio;
import notes;

const int NOTES_MAX = 15;
SoundBuffer[NOTES_MAX] buffers;

void main()
{
    for (int i = 0; i < NOTES_MAX; ++i) {
        buffers[ i ] = new SoundBuffer();
    }

    buffers[0].loadFromFile("wav/c1.wav");
    buffers[1].loadFromFile("wav/c1s.wav");
    buffers[2].loadFromFile("wav/d1.wav");
    buffers[3].loadFromFile("wav/d1s.wav");
    buffers[4].loadFromFile("wav/e1.wav");
    buffers[5].loadFromFile("wav/f1.wav");
    buffers[6].loadFromFile("wav/f1s.wav");
    buffers[7].loadFromFile("wav/g1.wav");
    buffers[8].loadFromFile("wav/g1s.wav");
    buffers[9].loadFromFile("wav/a1.wav");
    buffers[10].loadFromFile("wav/a1s.wav");
    buffers[11].loadFromFile("wav/b1.wav");
    buffers[12].loadFromFile("wav/c2.wav");
    buffers[13].loadFromFile("wav/c2s.wav");
    buffers[14].loadFromFile("wav/d2.wav");

    Notes notes = new Notes();
    writef("Play it!\n");

    while (!Keyboard.isKeyPressed(Keyboard.Key.Q)) {
        notes.pianoLogic();        
    }
    writefln("");
}

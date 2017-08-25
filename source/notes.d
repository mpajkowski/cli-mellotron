module notes;

import main;
import dsfml.audio;
import dsfml.graphics;

class Notes
{
public:
    enum Note { c, cis, d, dis, e, f, fis, g, gis, a, ais, b, c2, cis2, d2};

    this()
    {
    	for (size_t i = 0; i < NOTES_MAX; ++i) {
    		sounds[ i ] = new Sound();
    	}

    	for (size_t i = 0; i < NOTES_MAX; ++i) {
	        sounds[ i ].setBuffer(buffers[i]);
	        sounds[ i ].pitch(2);

	        sounds[Note.cis].volume(67);
	        sounds[Note.dis].volume(67);
	        sounds[Note.fis].volume(67);
	        sounds[Note.gis].volume(67);
	        sounds[Note.ais].volume(67);
	        sounds[Note.cis2].volume(67);
    	}
    }

    void pianoLogic()
    {
    	noteListener(Note.c, Keyboard.isKeyPressed(Keyboard.Key.Z));
        noteListener(Note.d, Keyboard.isKeyPressed(Keyboard.Key.X));
        noteListener(Note.e, Keyboard.isKeyPressed(Keyboard.Key.C));
        noteListener(Note.f, Keyboard.isKeyPressed(Keyboard.Key.V));
        noteListener(Note.g, Keyboard.isKeyPressed(Keyboard.Key.B));
        noteListener(Note.a, Keyboard.isKeyPressed(Keyboard.Key.N));
        noteListener(Note.b, Keyboard.isKeyPressed(Keyboard.Key.M));
        noteListener(Note.c2, Keyboard.isKeyPressed(Keyboard.Key.Comma));
        noteListener(Note.d2, Keyboard.isKeyPressed(Keyboard.Key.Period));

        // black keys
        noteListener(Note.cis, Keyboard.isKeyPressed(Keyboard.Key.S));
        noteListener(Note.dis, Keyboard.isKeyPressed(Keyboard.Key.D));
        noteListener(Note.fis, Keyboard.isKeyPressed(Keyboard.Key.G));
        noteListener(Note.gis, Keyboard.isKeyPressed(Keyboard.Key.H));
        noteListener(Note.ais, Keyboard.isKeyPressed(Keyboard.Key.J));
        noteListener(Note.cis2, Keyboard.isKeyPressed(Keyboard.Key.L));
    }
    
private:
    Sound[NOTES_MAX] sounds;
    bool[NOTES_MAX] noteHitted;

    void noteListener(Note note, bool isKeyPressed)
    {
    	if (isKeyPressed) {
	        if (!noteHitted[note]) {
	            sounds[note].play();
	            noteHitted[note] = true;
	        }
	    } else {
	        sounds[note].stop();
	        noteHitted[note] = false;
	    }
    }
}
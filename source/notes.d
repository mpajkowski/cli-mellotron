module notes;

import main;
import dsfml.audio;

class Notes
{
public:
    enum Note { c, cis, d, dis, e, f, fis, g, gis, a, ais, b, c2, cis2, d2};

    this()
    {
    	for (int i = 0; i < NOTES_MAX; ++i) {
    		sounds[ i ] = new Sound();
    	}

    	for (int i = 0; i < NOTES_MAX; ++i) {
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

    void playNote(Note note, bool isKeyPressed)
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
    
private:
    Sound[NOTES_MAX] sounds;
    bool[NOTES_MAX] noteHitted;
}
import QtQuick 2.0
import QtMultimedia 5.0

Item
{
    width: 120
    height: 120

    property bool dead: false

    function setCalm() // Живое состояние врага
    {
            enemy.jumpTo("calm")
            dead = false

    }

    function setDead() // Смерть врага

    {
        if(!dead)
        {
            saw.play()
            enemy.jumpTo("dead1")
            enemy.jumpTo("dead2")
            enemy.jumpTo("dead3")
            enemy.jumpTo("dead4")
            enemy.jumpTo("dead5")
            enemy.jumpTo("dead6")
            enemy.jumpTo("dead7")

            dead = true
        }
    }

    SpriteSequence
    {
        id: enemy
        width: 118
        height: 118
        interpolate: false

        Sprite
        {
            name: "calm"
            source: "bunny.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1500
            frameX: 0
            frameY: 254
        }

        Sprite
        {
            name: "dead1"
            source: "bleedinbunny1.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead2"
            source: "bleedinbunny2.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead3"
            source: "bleedinbunny3.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead4"
            source: "bleedinbunny4.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead5"
            source: "bleedinbunny5.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead6"
            source: "bleedinbunny6.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead7"
            source: "bleedinbunny7.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1500
            frameX: 0
            frameY: 254
        }
    }

  /*  PropertyAnimation
    {
        target: enemy
        properties: Sprite
        from: "dead1"
        to: "dead7"
        duration: 500
        running: enemy.currentSprite === "calm"
        loops: Animation.Infinite
    }
*/

    SoundEffect
    {
        id: saw
        source: "saw.wav"
    }

    Timer
    {
        interval: 5
        triggeredOnStart: true
        running: true
        repeat: true

        onTriggered:
        {
            if(parent.x < -120){
                parent.x = 1600 + Math.random() * 200 - 100
                var temp1 = Math.random() * 4
                temp1 -= temp1 % 1
                parent.y = temp1 * 120
                parent.setCalm()
            }
            parent.x -= 1
        }
    }
}

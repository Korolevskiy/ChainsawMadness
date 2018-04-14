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
            enemy.jumpTo("dead")
            saw.play()
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
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }

        Sprite
        {
            name: "dead"
            source: "bunny dead.png"
            frameCount: 1
            frameWidth: 1234
            frameHeight: 1685
            frameX: 0
            frameY: 354
        }
    }
/*
    PropertyAnimation
    {
        target: enemy
        properties: "x"
        from: -5
        to: 5
        duration: 100
        running: enemy.currentSprite === "anxious"
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

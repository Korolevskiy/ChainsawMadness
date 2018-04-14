import QtQuick 2.0

QtObject {
    property int liveEnemies: 0;
    // Ссылка на объект сцены для динамического создания объектов
    property var gameBoard: null

    // Геометрия управляемого объекта
    property int actorWidth: 0
    property int actorHeight: 0

    // Геометрия неигрового объекта
    property int enemyWidth: 0
    property int enemyHeight: 0

    // Количество генерируемых неигровых объектов
    property int enemyNumber: 300

    // Список (массив) неигровых объектов
    property var enemies: []

    // Расстояния между объектами для отслеживания коллизий,
    // заданные относительно размера управляемого объекта
    property real trampleDistance: 0.6
    property real angerDistance: 1.2

    /*!
     * Создает заданное количество неигровых элементов,
     * случайным образом размещая их на сцене
     */
    function generateEnemies()
    {
        // Создаем компонент на основе QML-описания
        var component = Qt.createComponent("Enemy.qml")

        // Отдельно генерируем каждый объект
        for (var i = 0; i < enemyNumber; i++)
        {
            // Выбираем новые случайные координаты до тех пор,
            // пока объект изначально попадает в коллизию с управляемым персонажем
            do
            {
                // Генерируем случайные координаты
                var x = 800 + Math.floor(Math.random(1)*1600)
                var y = Math.floor((i % 4) * 120)
                // Вычисляем расстояние до центра сцены
                var dx = Math.abs(x + enemyWidth / 2 - gameBoard.width / 2)
                var dy = Math.abs(y + enemyHeight / 2 - gameBoard.height / 2)
            } while (dx < actorWidth && dy < actorHeight)

            // Создаем экземпляр компонента
            var sprite = component.createObject(gameBoard, {"x": x, "y": y, "z": 0});
            // Добавляем созданный объект в список
            enemies.push(sprite)
        }

        liveEnemies = enemyNumber;
    }

    /*!
     * Отслеживает коллизии и модифицирует состояния
     * неигровых объектов соответственно
     * На вход функция получает координаты игрового персонажа
     */
    function processCollisions(x, y)
    {
        // Для каждого элемента списка выполняем функцию проверки
        enemies.forEach(function(enemy)
        {
            // Вычисляем расстояние между центрами игрового персонажа и объекта
            var dx = Math.abs((x + actorWidth / 2) - (enemy.x + enemyWidth / 2))
            var dy = Math.abs((y + actorHeight / 2) - (enemy.y + enemyHeight / 2))
            var d = Math.sqrt(dx * dx + dy * dy)
            // Изменяем состояние объекта в соответствии с условиями коллизии
            if ((d < actorWidth * trampleDistance) && (!enemy.dead))
            {
                enemy.setDead()
                liveEnemies--;
            }
        })
    }
}

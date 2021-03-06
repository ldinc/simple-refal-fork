# Компилятор Простого Рефала
# О языке и компиляторе

Язык Простой Рефал¹ является диалектом языка РЕФАЛ. Основной целью языка
было изучение трансляции программ на РЕФАЛе в императивный код. Как следствие,
компилятор изначально делался максимально простым, в частности, язык
разрабатывался в расчёте на однопроходную компиляцию.

Сейчас язык и компилятор стали сложнее, но концептуальной целостности,
я надеюсь, язык не потерял.

Особенности языка, отличающие его от других диалектов РЕФАЛа:
* Функции — подмножество Базисного РЕФАЛа, т.е. расширенных конструкций
  типа условий, блоков, действий и т.д. не имеют.
* Вложенные безымянные функции.
* Предобъявления всех именованных сущностей (функции, идентификаторы).
* Идентификаторы (аналог compound-символов) не могут создаваться
  во время выполнения.

Особенности компилятора:
* Компилирует в C++.
* Самоприменимый, написан на себе.
* Есть нативный FFI к C++, IMHO, достаточно удобный.


¹ **Внимание!** Название языка и компилятора следует писать так, как здесь написано:
*Простой Рефал*, оба слова с большой буквы. Допустимо название писать
по-английски: *Simple Refal*.

## Установка

1. Если вы используете Windows, укажите в файле `c-plus-plus.conf.bat`
   используемый компилятор C++ (раскомментируйте одну из строчек, либо вручную
   установите командную строку вызова компилятора в качестве переменной
   `CPPLINE`).
2. Запустите `bootstrap.bat` (`./bootstrap.sh`) для подготовки компилятора
   к работе.
3. Добавьте появившийся каталог bin к списку каталогов переменной среды `PATH`.
4. Используйте srmake, указывая в ключе `-d` путь к каталогу `srlib` данного
   дистрибутива (подробнее о srmake описано в руководстве пользователя).

## Лицензия
Компилятор распространяется по двухпунктной лицензии BSD с оговоркой
относительно компонентов стандартной библиотеки и рантайма — их можно
распространять в бинарной форме без указания копирайта. При отсутствии данной
оговорки для скомпилированных программ пришлось бы указывать копирайт самого
компилятора, что неразумно.
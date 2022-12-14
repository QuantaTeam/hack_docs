---
title: "Анализ аномалий"
toc: true
next: true
weight: 2
bold: true
---

В первую очередь, следует взглянуть на данные, так как только тогда сформируется понимание
о том, с чем мы имеем дело.

## Анализ данных

Анализ данных был проведен с использованием инструментов языка Python.
Ссылка на анализ: https://colab.research.google.com/drive/186RlUu5Sz_kN6QaBp44LP0UTCf4ZUi6x?usp=sharing
Ссылка на данные: https://drive.google.com/file/d/1js39tsfGu4FVcER8fQ-p8lku0WkHDFtA/view?usp=sharing
## Итоги анализа данных

Проведенная работа позволила определить, что в данной задаче не требуется применение
алгоритмов машинного обучения, так как данные строго категоризированы и имеют
фиксированный список возможных значений.
Тем не менее, в качестве рекомендации на будущее можно предложить использование распознавание текстов комментариев, описаний и
отзывов с помощью нейронных сетей, чтобы делать более детализированный анализ данных по заявкам.

Например, искать несоответствия в описаниях с наименованием дефектов, или искать "странности" в комментариях.

## Сформулированные критерии аномальности

Теперь можно предоставить список критериев аномальности, согласно которым мы формировали рекомендованный 
список заявок.
Для начала приведем уже сформулированные критерии:
1. Заявки, закрытые без выполнения. Заявки в статусах «закрытые», «закрытые
через МАРМ», с типом дефектов кроме «Ввод в эксплуатацию ИПУ воды (замена,
демонтаж, пропуск межповерочного интервала)», «Подача документов о поверке ИПУ
воды в электронном виде» с результативностью кроме «Выполнено» с любым
результатом закрытия, кроме «Аварийное/плановое отключение», поступившие от
заявителя по одному и тому же типу дефекта в течение определенного промежутка
времени с момента закрытия первичной заявки согласно критериям Приложения 3.
2. Заявки в статусах «закрытые», «закрытые через МАРМ», с типом дефектов
кроме «Ввод в эксплуатацию ИПУ воды (замена, демонтаж, пропуск межповерочного
интервала)», «Подача документов о поверке ИПУ воды в электронном виде» с
результативностью «Выполнено», срок выполнения заявки более 10 минут без
возвратов на доработку («Кол-во возвратов на доработку» пусто), поступившие от
заявителя по одному и тому же типу дефекта в течение определенного промежутка
времени с момента закрытия первичной заявки согласно критериям Приложения 3 .
3. Заявки в статусах «закрытые», «закрытые через МАРМ с результативностью
«Выполнено», срок выполнения заявки менее 10 минут без возвратов на доработку
(«Кол-во возвратов на доработку» пусто), которые можно выполнить менее чем за 10
минут. Перечень дефектов, заявки по которым можно закрыть менее чем за 10 минут,
указан в Приложении 2. Заявки рассматриваются, если после такого закрытия
поступает повторное обращение жителей по той же проблеме от заявителя в течение
определенного промежутка времени с момента закрытия первичной заявки, согласно
критериям Приложения 3
4. Быстрое выполнение заявки. В случае, если заявка была реализована менее,
чем за 10 минут, при условии, что данные работы физически невозможно выполнить в
рамках данного временного промежутка, так как сотрудник не успеет дойти до места и
выполнить работу. При применении данного критерия необходимо выбрать заявки в
статусах «закрытые», «закрытые через МАРМ» с результативностью «Выполнено»,
удалить из выборки заявки, которые можно закрыть в указанный промежуток времени
без возвращений на доработку («Кол-во возвратов на доработку» пусто). Перечень
дефектов, заявки по которым можно закрыть менее чем за 10 минут, указан в
Приложении 2.
5. Заявки в статусах «закрытые», «закрытые через МАРМ», у которых поле «Кол-во
возвратов на доработку» имеет значение отличное от «пусто» или «0», выбрать только те
дефекты, по которым возможен возврат на доработку с результативностью
«Выполнено». Перечень дефектов указан в Приложении 4. Данные заявки также
подпадают под критерии контроля ввиду того, что они переведены в закрывающий
статус, заявитель утверждает, что работы не выполнены или выполнены некачественно.
   
Дополнительно предложенные нами:
1. Если Наименование статуса заявки не в списке ['Закрыта', 'Закрыта через МАРМ']
(Потому что мы анализируем только закрытые заявки)
2. Если отзыв проставлен меньше чем за 10 минут с момента создания заявки, в случае если причина заявки **не входит** в список задач, которые **можно** выполнить за 10 минут.
3. Если отзыв проставлен меньше чем за 1 минуту с момента создания заявки для типа задач, которые **входят** в список задач, которые **могут** быть решены за 10 минут
4. Если оставлен плохой отзыв: "неудовлетворительно" или "плохо".

## Методика отбора

Благодаря выявлению критериев аномальности был разработан специальный внутренний сервис, который каждую минуту занимается отбором аномальных заявок, при этом не нагружая само приложение,
что помогает анализировать огромное число заявок за маленький промежуток времени.
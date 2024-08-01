import tkinter as tk
from tkinter import messagebox

def calculate_expected_income(probabilities, awards):
    expected_income = sum(p * a for p, a in zip(probabilities, awards))
    return expected_income

def calculate_cost(labor_cost, material_cost, other_cost):
    return labor_cost + material_cost + other_cost

def assess_participation(probabilities, awards, labor_cost, material_cost, other_cost):
    expected_income = calculate_expected_income(probabilities, awards)
    total_cost = calculate_cost(labor_cost, material_cost, other_cost)
    net_benefit = expected_income - total_cost

    if net_benefit &gt; 0:
        return net_benefit, &quot;Участие в конкурсе целесообразно.&quot;
    else:
        return net_benefit, &quot;Участие в конкурсе нецелесообразно.&quot;

def evaluate():
    try:
        # Получаем значения из полей ввода
        p1 = float(entry_prob1.get())
        p2 = float(entry_prob2.get())
        p3 = float(entry_prob3.get())
        p4 = float(entry_prob4.get())
        a1 = float(entry_award1.get())
        a2 = float(entry_award2.get())
        a3 = float(entry_award3.get())
        a4 = float(entry_award4.get())
        labor_cost = float(entry_labor.get())
        material_cost = float(entry_material.get())
        other_cost = float(entry_other.get())

        # Списки вероятностей и вознаграждений
        probabilities = [p1, p2, p3, p4]
        awards = [a1, a2, a3, a4]

        net_benefit, message = assess_participation(probabilities, awards, labor_cost, material_cost, other_cost)

        # Вывод результатов в сообщении
        messagebox.showinfo(&quot;Результат&quot;, f&quot;Чистая выгода: {net_benefit:.2f} рублей.\n{message}&quot;)
    except ValueError:
        messagebox.showerror(&quot;Ошибка ввода&quot;, &quot;Пожалуйста, введите числовые значения.&quot;)

# Создание главного окна приложения
root = tk.Tk()
root.title(&quot;Оценка участия в конкурсе&quot;)

# Поля ввода для вероятностей и вознаграждений
tk.Label(root, text=&quot;Вероятности выигрыша (в процентах):&quot;).grid(row=0, column=0, columnspan=2)
entry_prob1 = tk.Entry(root)
entry_prob1.grid(row=1, column=0)
entry_prob2 = tk.Entry(root)
entry_prob2.grid(row=1, column=1)
entry_prob3 = tk.Entry(root)
entry_prob3.grid(row=2, column=0)
entry_prob4 = tk.Entry(root)
entry_prob4.grid(row=2, column=1)
tk.Label(root, text=&quot;Вознаграждения:&quot;).grid(row=3, column=0, columnspan=2)
entry_award1 = tk.Entry(root)
entry_award1.grid(row=4, column=0)
entry_award2 = tk.Entry(root)
entry_award2.grid(row=4, column=1)
entry_award3 = tk.Entry(root)
entry_award3.grid(row=5, column=0)
entry_award4 = tk.Entry(root)
entry_award4.grid(row=5, column=1)

# Поля ввода для затрат
tk.Label(root, text=&quot;Затраты на трудозатраты:&quot;).grid(row=6, column=0)
entry_labor = tk.Entry(root)
entry_labor.grid(row=6, column=1)
tk.Label(root, text=&quot;Затраты на материалы:&quot;).grid(row=7, column=0)
entry_material = tk.Entry(root)
entry_material.grid(row=7, column=1)
tk.Label(root, text=&quot;Прочие затраты:&quot;).grid(row=8, column=0)
entry_other = tk.Entry(root)
entry_other.grid(row=8, column=1)

# Кнопка для оценки участия
button_evaluate = tk.Button(root, text=&quot;Оценить участие&quot;, command=evaluate)
button_evaluate.grid(row=9, column=0, columnspan=2)

# Запуск главного цикла приложения
root.mainloop()


### Описание кода:
1. **Импорт библиотек**: Используем библиотеку `tkinter` для создания GUI и `messagebox` для вывода сообщений пользователю.
2. **Определение функций**: Функции для расчета ожидаемого дохода, общих затрат и оценки участия, как и в предыдущем примере.
3. **Функция `evaluate`**: Получает данные из интерфейса, рассчитывает чистую выгоду и выводит результат через окно сообщения. Обрабатывает возможные ошибки ввода.
4. **Создание графического интерфейса**: Создаются поля для ввода вероятностей выигрыша, вознаграждений и затрат, а также кнопка для оценки.
5. **Запуск приложения**: Вызов метода `mainloop()` для отображения интерфейса и ожидания пользовательского ввода.

### Как использовать:
1. Скопируйте код в файл с расширением `.py` (например, `contest_assessment.py`).
2. Убедитесь, что у вас установлен Python. Запустите файл с помощью Python. Появится графический интерфейс.
3. Введите значения для вероятностей, вознаграждений и затрат, затем нажмите кнопку "Оценить участие". Результаты будут отображены в окне сообщения.

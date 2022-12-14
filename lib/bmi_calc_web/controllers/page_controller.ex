defmodule BmiCalcWeb.PageController do
  use BmiCalcWeb, :controller

  def index(conn, _params) do
    goal =  "To see your results, enter your height and weight"
    render(conn, "index.html", goal: goal)
  end

  def result(conn, _params =%{"bmi" => user_input}) do
    [feet, inches, wt] =
      [user_input["feet"],user_input["inches"], user_input["wt"] ]
      |> Enum.map(fn n -> {float, _} = Float.parse(n); float end)

    goal = BmiCalc.Calc.initial_wt_loss_goal({feet, inches}, wt)
    render(conn, "index.html", goal: goal)
  end
end

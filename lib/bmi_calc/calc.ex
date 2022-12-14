defmodule BmiCalc.Calc do
  # BMI = kg / (m * m)
  # 18.5 to 25 => Healthy weight
  # to 30 => Overweight
  # 30+ Obese


  def initial_wt_loss_goal({feet, inch}, current_wt) do
    {kgs_to_shed, weeks} = wt_loss_goal(current_wt, max_weight(feet, inch))

    if kgs_to_shed < 1 do
      "You don't have to lose any weight ! "
    else
      "Shedding #{kgs_to_shed} kg over #{weeks} weeks is achievable for most people. After reaching this goal, set your next goal."
    end
  end



  def wt_loss_goal(current_wt, max_wt) when current_wt <  max_wt, do: {0, 0}
  def wt_loss_goal(current_wt, max_wt) when current_wt > max_wt do
    kgs_to_shed = if (current_wt - max_wt) < current_wt * 0.05, do: (current_wt - max_wt), else: current_wt * 0.05
    {round(kgs_to_shed), round(kgs_to_shed/0.34)}
  end


  # defp min_weight(feet, inch), do: 18.5 * (to_meter(feet, inch) * to_meter(feet, inch))
  defp max_weight(feet, inch), do: 25 * (to_meter(feet, inch) * to_meter(feet, inch))
  defp to_meter(feet, inch), do: (feet * 12 + inch) * 0.0254
end

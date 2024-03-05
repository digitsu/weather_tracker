defmodule WeatherTracker.Repo.Migrations.SetUpWeatherDataTable do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS timescaledb")

    create table(:weather_conditions, primary_key: false) do
      add :timestamp, :timestamptz, null: false
      add :altitude_m, :decimal, null: false
      add :pressure_pa, :decimal, null: false
      add :temperature_c, :decimal, null: false
      add :voc_index, :decimal, null: false
      add :light_lumens, :decimal, null: false
      add :humidity_rh, :decimal, null: false
      add :dew_point_c, :decimal, null: false
      add :gas_resistance_ohms, :decimal, null: false
    end

    execute("SELECT create_hypertable('weather_conditions', 'timestamp')")
  end
  def down do
    drop table(:weather_conditions)
    execute("DROP EXTENSION IF EXISTS timescaledb")
  end
end

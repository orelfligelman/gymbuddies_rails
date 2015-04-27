class Butt
  def initialize(app)
    @app = app
  end
  def call(env)
    @app.call(env)
  end
  def fart
    @app.butt.fart
  end


  def shart
    @app.fart.solid_excretion
  end

  def solid_excretion?
    if @butt.residue == true
end
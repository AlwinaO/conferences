require './config/environment'


use Rack::MethodOverride

use UsersController
use ConferencesController
run ApplicationController

<?php

interface Pessoas {
   public function iniciar_curso();
   public function adicionar_atividade($atv);
}

abstract class Usuarios implements Pessoas{
   protected $nome;
   protected $tipo_usuario;
   protected $xp;
   protected $atv;

   public function __construct($nome,$tipo_usuario,$xp = 0,$atv="")
   {
      $this->nome = $nome;
      $this->tipo_usuario = $tipo_usuario;
      $this->xp = $xp;
      $this->atv =$atv;
   }
   public function adicionar_atividade($atv)
   {
      if($atv)
      {
         $this->xp = $this->xp +100;
      }
      else
      {
         echo "Por favor, insira a atividade feita";
      }
   }

   public function iniciar_curso()
   {
      return "cadastrado";
   }

   public function exibir_status()
   {
     return "Usuário: $this->nome\nTipo: $this->tipo_usuario\nXP acumulado: $this->xp\n";
   }
}

Class Aluno extends Usuarios{

   protected $feedbacks;

   public function __construct($nome, $tipo_usuario, $xp = 0, $atv ="")
   {
      parent::__construct($nome, $tipo_usuario, $xp, $atv);
   }

   public function adicionar_atividade($atv)
   {
      $this->xp = $this->xp +50;
      echo "\nparabens, voce concluiu a atividade $atv e recebeu mais 50 pontos de experiência\n";
   }

   public function exibir_status()
   {
      return parent::exibir_status();
   }

   public function dar_feedback($mensagem,Professor $professor)
   {
      if($mensagem == "bom")
      {
         $novo_feedback = new Feedback($mensagem,$this,$professor);
         $professor->receber_feedback($novo_feedback);
         echo "\nVoce deu um bom feedback ao professor, ele vai ficar feliz!\n";
      }
      elseif($mensagem == "ruim")
      {
         $novo_feedback = new Feedback($mensagem,$this,$professor);
         $professor->receber_feedback($novo_feedback);
         echo "O professor recebeu o feedback e verá o que precisa ser melhorado!";
      }
   }

   public function matricular_curso(Curso $curso)
   {
      $curso->nova_matricula($this);
      echo "\n $this->nome foi registrado com sucesso no curso:$curso->nome! \n";
   }

   public function concluir_curso(Curso $curso){
      $this->xp = $this->xp + $curso->xp_conclusao;
      echo "\n parabens $this->nome por concluir o curso $curso->nome, como recompensa você recebeu $curso->xp_conclusao pontos de experiência! \n";
   }
}

class Professor extends Usuarios{

   public $feedbacks = [];
   public $cursos = [];

   public function __construct($nome, $tipo_usuario, $xp = 0, $atv = "")
   {
      parent::__construct($nome, $tipo_usuario, $xp, $atv);
   }

   public function adicionar_atividade($atv)
   {
      $this->xp = $this->xp +25;
      echo "\nparabens, voce criou a atividade $atv e recebeu mais 25 pontos de experiência\n";
   }

   public function exibir_status()
   {
       return parent::exibir_status();
   }

   public function receber_feedback(Feedback $novo_feedback){
      $this->feedbacks[] = $novo_feedback;

      if($novo_feedback->mensagem == "bom")
      {
         $this->xp = $this->xp +75;
      }
      if($novo_feedback->mensagem == "ruim")
      {
         $this->xp = $this->xp -10;
      }
   }

   public function exibir_feedbacks(){

      foreach($this->feedbacks as $feedbacks)
      {
         echo "\nFeedback: {$feedbacks->mensagem}";
         echo "\nAluno: {$feedbacks->aluno->nome}\n";
      }
   }

   public function criar_curso($nome,$xp_conclusao){

      $this->xp = $this->xp + 100;
      $novo_curso = new Curso($nome,$xp_conclusao,$this);
      $this->cursos[] = $novo_curso;
      echo "\ncurso criado com sucesso! voce ganhou 100 pontos de experiencia!\n";
      return $novo_curso;
   }
}

class Feedback{
   public $mensagem;
   public $aluno;
   public $professor;

   public function __construct($mensagem,$aluno,$professor)
   {
      $this->mensagem = $mensagem;
      $this->aluno = $aluno;
      $this->professor = $professor;
   }
}

class Curso
{
   public $nome;
   public $xp_conclusao;
   public $aluno;
   public $professor;
   public $novos_alunos = [];

   public function __construct($nome,$xp_conclusao,$professor)
   {
      $this->nome = $nome;
      $this->xp_conclusao = $xp_conclusao;
      $this->professor = $professor;
   }

   public function exibir_cursos()
   {
      echo "\nCurso:$this->nome\nXP ao realizar:$this->xp_conclusao\n";
   }

   public function nova_matricula(Aluno $aluno)
   {
      $this->novos_alunos[] = $aluno; 
   }

}


$Evandro = new Professor("Evandro","Professor");
$Emanuel = new Aluno("Emanuel","Aluno");

$Evandro->adicionar_atividade("Prova P2");
//não sei se é a melhor forma guardar isso em uma variavel com o nome do curso
$Javascript_basico = $Evandro->criar_curso("Javascript basico",300);

$Emanuel->adicionar_atividade("Revisão da P2");
$Emanuel->dar_feedback("bom",$Evandro);
$Emanuel->dar_feedback("ruim",$Evandro);
$Emanuel->matricular_curso($Javascript_basico);
$Emanuel->concluir_curso($Javascript_basico);

$Evandro->exibir_feedbacks();

echo $Evandro->exibir_status();
echo $Emanuel->exibir_status();

?>
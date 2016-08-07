	package br.com.project.checkskills.entities.autenticacao;

import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import br.com.project.checkskills.entities.dadosbasicos.FuncionarioEntity;
import br.com.project.checkskills.utils.BaseEntity;

//declara como sendo uma Entidade no Banco
@Entity
//sobrescreve o nome da tabela do BD se necessario
@Table(name= "TB_USUARIO")
//Sobrescreve o nome do id em AbstractPersistable, somente quando o 
//nome da chave primaria � difernete do nome da tabela
@AttributeOverride(name = "id", column = @Column(name = "ID_USUARIO"))
@Component(value="usuarioEntity")
public class UsuarioEntity extends BaseEntity<Long> {

	
	private static final long serialVersionUID = 1L;

	@Column(name="NOME", length=120,nullable=false)
	private String nome ;
	
	@Column(name="EMAIL", length=255,nullable=false , unique=true)
	private String email;
	
	@Column(name="PASSWORD", length=128,nullable=false )
	private String password;


	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "ASS_USUARIO_PERMISSAO", joinColumns = @JoinColumn (name="ID_USUARIO")
	, inverseJoinColumns = @JoinColumn(name = "ID_PERMISSAO"))
	private List<PermissaoEntity> permissions;
	
	@OneToOne(mappedBy="usuarioEntity")
	private FuncionarioEntity funcionarioEntity;
	
	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public List<PermissaoEntity> getPermissions() {
		return permissions;
	}


	public void setPermissions(List<PermissaoEntity> permissions) {
		this.permissions = permissions;
	}


	public FuncionarioEntity getFuncionarioEntity() {
		return funcionarioEntity;
	}
	
	public void setFuncionarioEntity(FuncionarioEntity funcionarioEntity) {
		this.funcionarioEntity = funcionarioEntity;
	}


	public UsuarioEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public UsuarioEntity(String nome, String email, String password, List<PermissaoEntity> permissions,
			FuncionarioEntity funcionarioEntity) {
		super();
		this.nome = nome;
		this.email = email;
		this.password = password;
		this.permissions = permissions;
		this.funcionarioEntity = funcionarioEntity;
	}
			
	
	
	
}

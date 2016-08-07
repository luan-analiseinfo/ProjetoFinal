package br.com.project.checkskills.entities.dadosbasicos;

import javax.persistence.AttributeOverride;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import br.com.project.checkskills.entities.autenticacao.UsuarioEntity;
import br.com.project.checkskills.utils.BaseEntity;

@Entity
@Table(name="TB_FUNCIONARIO")
@AttributeOverride(name = "id", column = @Column(name = "ID_FUNCIONARIO"))
public class FuncionarioEntity extends BaseEntity<Long> {

	private static final long serialVersionUID = 1L;
	
	
	private String nome;
	
	@OneToOne( cascade = CascadeType.ALL, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name="ID_USUARIO")
	private UsuarioEntity usuarioEntity;


	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public UsuarioEntity getUsuarioEntity() {
		return usuarioEntity;
	}

	public void setUsuarioEntity(UsuarioEntity usuarioEntity) {
		this.usuarioEntity = usuarioEntity;
	}
	
	

}

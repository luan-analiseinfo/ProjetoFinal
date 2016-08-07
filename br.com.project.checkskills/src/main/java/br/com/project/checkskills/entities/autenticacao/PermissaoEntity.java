
package br.com.project.checkskills.entities.autenticacao;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.project.checkskills.utils.BaseEntity;

@Entity
@Table(name="TB_PERMISSAO")
@AttributeOverride(name="id", column=@Column(name="ID_PERMISSAO"))
public class PermissaoEntity extends BaseEntity<Long>{

	
	private static final long serialVersionUID = 1L;
	
	@Column(name="role", length=45, nullable=false, unique=true)
	private String role;
	
	public PermissaoEntity() {
	}

	
	public PermissaoEntity(String role) {
		super();
		this.role = role;
	}


	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	

	
	
	
}
package br.com.project.checkskills.test.repositories;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Ignore;
import org.junit.Test;

import br.com.project.checkskills.entities.autenticacao.UsuarioEntity;
import br.com.project.checkskills.entities.dadosbasicos.FuncionarioEntity;
import br.com.project.checkskills.repositories.autenticacao.IUsuarioRepository;
import br.com.project.checkskills.repositories.dadosbasicos.IFuncionarioRepository;
import br.com.project.checkskills.test.utils.AbstractDatabaseTest;

public class UserRepositoryTest extends AbstractDatabaseTest {

	private static final Logger LOGGER = Logger.getLogger(UserRepositoryTest.class);

	@Inject
	private IUsuarioRepository userRepository;
	
	@Inject
	private IFuncionarioRepository funcionarioRepository;
	
	@Ignore
	@Test
	public void testDelete() {
		this.funcionarioRepository.delete(1L);
	}
	
	
	@Test
	public void testFindAll() {
		
		List<UsuarioEntity> users = this.userRepository.findAll();

		LOGGER.info(users);
	}

	@Ignore
	@Test
	public void user() {
		
		UsuarioEntity usuarioEntity = this.userRepository.findById(1L);
		 LOGGER.info(usuarioEntity);
	}
	
	@Ignore
	@Test
	public void saveUser(){
		
		UsuarioEntity usuarioEntity = new UsuarioEntity();
		
		usuarioEntity.setId(3L);
		usuarioEntity.setNome("luan");
		usuarioEntity.setPassword("1312313");
		usuarioEntity.setEmail("pedro@lucas.com");
		
		
		FuncionarioEntity funcionarioEntity = new FuncionarioEntity();
		funcionarioEntity.setId(3L);
		funcionarioEntity.setNome("luan atualizado");
		funcionarioEntity.setUsuarioEntity(usuarioEntity);
		
		usuarioEntity.setFuncionarioEntity(funcionarioEntity);
		
		try {
		this.funcionarioRepository.save(funcionarioEntity);	
		
		} catch (Exception e) {
				e.printStackTrace();
		}
		
		
		
		
		LOGGER.info(funcionarioEntity);
	}

	public IFuncionarioRepository getFuncionarioRepository() {
		return funcionarioRepository;
	}

	public void setFuncionarioRepository(IFuncionarioRepository funcionarioRepository) {
		this.funcionarioRepository = funcionarioRepository;
	}
	
}
